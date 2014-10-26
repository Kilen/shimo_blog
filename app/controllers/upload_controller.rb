require "securerandom"

class UploadController < ApplicationController
  skip_before_action :verify_authenticity_token

  def image
    image = params[:image]
    name = SecureRandom.hex(10) + File.extname(image.original_filename)
    path = File.join("public/images/upload", name)
    File.open(path, "wb") { |f| f.write(image.read) }
    render json: { success: true, file_path: "/images/upload/#{name}" }
  end
end
