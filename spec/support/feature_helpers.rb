module FeatureHelpers
  def login(user=nil)
    user ||= FactoryGirl.create(:user)
    visit user_session_path
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
    user
  end
end
