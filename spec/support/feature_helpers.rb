module FeatureHelpers
  def login_admin
    login_user FactoryGirl.create(:admin)
  end

  def login_user(user=nil)
    user ||= FactoryGirl.create(:user)
    visit user_session_path
    within('#new_user') do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
    end
    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully'
    user
  end
end
