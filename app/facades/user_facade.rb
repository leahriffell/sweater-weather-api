class UserFacade
  def self.register(user_details)
    User.create(user_details)
  end
end