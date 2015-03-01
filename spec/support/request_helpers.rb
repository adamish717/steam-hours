module RequestHelpers
  def login_admin
    login_user FactoryGirl.create(:admin)
  end

  def login_user(user=nil)
    user ||= FactoryGirl.create(:user)
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end
