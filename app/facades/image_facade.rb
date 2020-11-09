class ImageFacade
  def self.get_background(location)
    Image.new(ImageService.fetch_image(location))
  end
end