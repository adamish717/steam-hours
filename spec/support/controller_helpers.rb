module ControllerHelpers
  def login_admin
    login_user FactoryGirl.create(:admin)
  end

  def login_user(user=nil)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user ||= FactoryGirl.create(:user)
    sign_in user
    user
  end
end
