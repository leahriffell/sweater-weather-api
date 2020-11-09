class Image
  attr_reader :description, 
              :url,
              :credits

  def initialize(details)
    @description = details[:results][0][:description]
    @url = details[:results][0][:urls][:regular]
    @credits = {
                artist_username: details[:results][0][:user][:username], 
                artist_name: details[:results][0][:user][:name], profile_url: details[:results][0][:user][:links][:html]
              }
  end
end