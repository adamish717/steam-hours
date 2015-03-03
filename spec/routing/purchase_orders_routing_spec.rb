require "rails_helper"

RSpec.describe Admin::PurchaseOrdersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/purchase_orders").to route_to("admin/purchase_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/purchase_orders/new").to route_to("admin/purchase_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/purchase_orders/1").to route_to("admin/purchase_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/purchase_orders/1/edit").to route_to("admin/purchase_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/purchase_orders").to route_to("admin/purchase_orders#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/purchase_orders/1").to route_to("admin/purchase_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/purchase_orders/1").to route_to("admin/purchase_orders#destroy", :id => "1")
    end

  end
end
