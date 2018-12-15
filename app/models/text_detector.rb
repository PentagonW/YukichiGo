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
    return unless temp = result["responses"].first
    return unless temp = temp["textAnnotations"]
    return unless temp = temp.first

    temp["description"]
  end

  def labels
    return if invalid?

    result["responses"].first["labelAnnotations"].map {|annotation| annotation["description"] }
  end

  def serial_number
    return if invalid?

    # シリアルナンバーが読み取れないことがあるので、読み取れない時は仕方なくランダムな文字列を返す
    if text&.gsub(" ", "")&.match(/[A-Z]{2}[\d]+[A-Z]/)
      text.gsub(" ", "").match(/[A-Z]{2}[\d]+[A-Z]/)[0]
    end
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
          features: [{
            type: 'TEXT_DETECTION',
            maxResults: 5
          },
          {
            type: 'LABEL_DETECTION',
            maxResults: 5
          }]
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
