class UserFacade
  def self.register(user_details)
    User.create(user_details)
  end

  def self.find_by_email(email)
    User.find_by(email: email)
  end
end