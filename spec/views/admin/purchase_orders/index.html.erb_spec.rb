require 'rails_helper'

RSpec.describe "admin/purchase_orders/index", :type => :view do
  before(:each) do
    @purchase_orders = FactoryGirl.create_list(:purchase_order, 2)
    assign(:purchase_orders, @purchase_orders)
  end

  it "renders a list of purchase_orders" do
    render
    decoded = decode rendered
    assert_select 'tbody>tr', :count => 2
    expect(decoded).to include(@purchase_orders.first.title)
    expect(decoded).to include(@purchase_orders.first.active ? 'true': 'false')
  end
end
