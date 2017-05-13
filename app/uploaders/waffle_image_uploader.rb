class WaffleImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  width = 100
  height = 50

  storage :dropbox

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url
  #   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzmzWaEg6gRujgmAi1ToElAJIymIbpeD168U3Wjo9rkId5ro7f"
  # end

  process resize_to_fit: [5*width, 5*height]

  version :small do
    process resize_to_fit: [width,height]
  end

end
