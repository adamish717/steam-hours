require 'rails_helper'

RSpec.describe 'Dashboard', :type => :request do
  describe 'User management' do
    it 'creates a user and redirects back to the dashboard' do
      login_user

      get '/admin'
      expect(response).to have_http_status(200)
      expect(response).to render_template('devise/invitations/_new')

      expect(response.body).to include('An invitation email has been sent to invited@example.com.')
    end
  end
end
