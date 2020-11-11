class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :authorized_user?

  def authorized_user?(user_key)
    User.exists?(api_key: user_key)
  end
end
