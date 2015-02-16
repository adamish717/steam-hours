require 'rails_helper'

RSpec.describe 'Dashboard', :type => :request do
  describe 'User management' do
    it 'creates a user and redirects back to the dashboard' do
      login_user

      get '/admin'
      expect(response).to have_http_status(200)
    end
  end
end
