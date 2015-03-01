require 'rails_helper'

RSpec.describe 'SignIn', :type => :feature do
  describe 'the signin process' do
    let(:user) { FactoryGirl.create(:user) }

    it 'signs me in' do
      login_user user
      expect(page).to have_content 'Signed in successfully'
    end
  end
end
