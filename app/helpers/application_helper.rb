module ApplicationHelper
  def qrcode_tag(url, options = {})
    RQRCode::QRCode.new(url).as_svg(options).html_safe
  end
end
