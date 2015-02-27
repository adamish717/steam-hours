require 'rails_helper'

RSpec.describe 'Inviting users', :type => :feature do

  feature 'Inviting users' do
    let!(:admin) { login }

    scenario 'displays a list of users' do
      visit admin_path
      expect(page).to have_content(admin.email)
    end

    context 'when a new user is invited' do
      before do
        visit admin_path

        fill_in 'user_email', with: 'new.invitee@example.com'
        click_button 'Invite User'
      end

      scenario 'displays an informative message' do
        expect(page).to have_content 'invitation email has been sent'
        expect(page).to have_content 'new.invitee@example.com'
      end

      scenario 'redirects to admin dashboard' do
        expect(current_path).to eq(admin_path)
      end

      context 'when accepting the invitation' do
        before do
          click_link 'Log Out'

          open_email 'new.invitee@example.com'
          current_email.click_link 'Accept invitation'
          expect(page).to have_content 'Create Account'

          fill_in 'user_password', with: 's3cr1t42'
          fill_in 'user_password_confirmation', with: 's3cr1t42'
          click_button 'Set my password'
        end

        it 'shows a confirmation' do
          expect(page).to have_content 'You are now signed in'
        end
      end
    end
  end
end
