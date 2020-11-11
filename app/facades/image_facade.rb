class ImageFacade
  def self.get_background(location)
    if ImageService.fetch_image(location)[:total] == 0
      ImageService.fetch_image(location)
    else
      Image.new(ImageService.fetch_image(location))
    end
  end
end