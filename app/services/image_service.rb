class ImageService
  def self.fetch_image(location)
    response = conn.get do |request|
      request.headers['Accept-Version'] = 'v1'
      request.params['client_id'] = ENV['IMAGE_API_KEY']
      request.params['query'] = location
      request.params['page'] = 1
      request.params['per_page'] = 1
      request.params['orientation'] = 'landscape'
    end
    parse(response)
  end

  private
  
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/search/photos?')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end