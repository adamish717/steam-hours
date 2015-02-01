require 'rails_helper'

RSpec.describe "purchase_orders/index", :type => :view do
  before(:each) do
    assign(:purchase_orders, [
      PurchaseOrder.create!(
        :name => "Name",
        :description => "MyText",
        :active => false
      ),
      PurchaseOrder.create!(
        :name => "Name",
        :description => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    assert_select 'tbody>tr', :count => 2
    expect(rendered).to include(@purchase_orders.first.title)
    expect(rendered).to include(@purchase_orders.first.description)
    expect(rendered).to include(@purchase_orders.first.active ? 'true': 'false')
  end
end
