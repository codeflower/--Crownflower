# frozen_string_literal: true

class QrCode < ApplicationRecord
  attr_accessor :qr_color, :qr_bg_color, :scan_allow
  after_create :generate_qr_code
  belongs_to :user
  validates :url, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  paginates_per 5

  has_one_attached :image

  def generate_qr_code
    # binding.pry

    if @scan_allow
      our_url = Rails.application.routes.url_helpers.qr_code_url(id)
    else
      our_url = self.url
    end



    qrcode = RQRCode::QRCode.new(our_url)
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: @qr_color,
      file: nil,
      fill: @qr_bg_color,
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    path = Rails.root.join("tmp/cache/qr-code-#{id}.png")

    IO.binwrite(path, png.to_s)

    image.attach(io: File.open(path), filename: "qr-code-#{id}.png", content_type: 'image/png')
  end
end
