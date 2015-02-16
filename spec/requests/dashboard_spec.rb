require 'rails_helper'

RSpec.describe 'Dashboard', :type => :request do
  describe 'User management' do
    it 'creates a user and redirects back to the dashboard' do
      login_user

      get '/admin'
      expect(response).to have_http_status(200)
      expect(response).to render_template('devise/invitations/_new')

      post '/users/invitation', user: { email: 'invited@example.com' }

      expect(response).to redirect_to('/admin')
      follow_redirect!

      expect(response).to render_template('admin/dashboard/index')
      expect(response.body).to include('An invitation email has been sent to invited@example.com.')
    end
  end
end
