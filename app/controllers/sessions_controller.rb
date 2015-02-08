class SessionsController < Devise::SessionsController
  skip_before_filter :auth_user, only: :new

  def create
    params[:user].merge!(remember_me: 1)
    super
  end
end
