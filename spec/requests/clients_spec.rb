require 'rails_helper'

RSpec.describe "Clients", :type => :request do
  before(:each) do
    login_user
  end

  describe "GET /clients" do
    it "works! (now write some real specs)" do
      get clients_path
      expect(response).to have_http_status(200)
    end
  end
end
