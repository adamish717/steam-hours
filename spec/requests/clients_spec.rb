require 'rails_helper'

RSpec.describe "Clients", :type => :request do
  context 'regular user' do
    before(:each) do
      login_user
    end

    describe "GET /admin/clients" do
      it "is hidden" do
        get admin_clients_path
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'admin' do
    before(:each) do
      login_admin
    end

    describe "GET /admin/clients" do
      it "responds" do
        get admin_clients_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
