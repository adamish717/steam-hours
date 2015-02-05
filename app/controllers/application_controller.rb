class ApplicationController < ActionController::Base
  before_filter :auth_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # :authenticate_user! without the flash. No need for an error.
  def auth_user
    redirect_to new_user_session_path unless user_signed_in?
  end
end
