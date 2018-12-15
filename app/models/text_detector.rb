class TextDetector
  include ActiveModel::Model

  attr_accessor :file, :response

  validate :success?

  delegate :code, to: :response, allow_nil: true

  def detect
    return @result if @result

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request["Content-Type"] = "application/json"
    @response = https.request(request, body)
  end

  def result
    return if invalid?

    @result ||= JSON.parse response.body
  end

  def text
    return if invalid?

    result["responses"].first["textAnnotations"].first["description"]
  end

  def serial_number
    text.gsub(" ", "").match(/[A-Z]{2}[\d]+[A-Z]/)[0]
  end

  def inline_text
    return unless text

    text.gsub(/\n/, '')
  end

  def success?
    errors.add(:response, :invalid) unless code.to_i == 200
  end

  private

    def base64_image
      @base64_image ||= Base64.strict_encode64(file.read)
    end

    def body
      {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            type: 'TEXT_DETECTION',
            maxResults: 5
          ]
        }]
      }.to_json
    end

    def uri
      @uri ||= URI.parse url
    end

    def url
      "#{ENV['CLOUD_VISION_API_URL']}?key=#{ENV['CLOUD_VISION_API_KEY']}"
    end
end
