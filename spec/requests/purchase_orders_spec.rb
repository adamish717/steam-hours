require 'rails_helper'

RSpec.describe "PurchaseOrders", :type => :request do
  context 'regular user' do
    before(:each) do
      login_user
    end

    describe "GET /admin/purchase_orders" do
      it "is hidden" do
        get admin_purchase_orders_path
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'admin' do
    before(:each) do
      login_admin
    end

    describe "GET /admin/purchase_orders" do
      it "responds" do
        get admin_purchase_orders_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
