require 'rails_helper'

RSpec.describe "purchase_orders/show", :type => :view do
  before(:each) do
    @purchase_order = assign(:purchase_order, PurchaseOrder.create!(
      :name => "Name",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(@purchase_order.title)
    expect(rendered).to include(@purchase_order.description)
    expect(rendered).to include(@purchase_order.active ? 'true': 'false')
  end
end
