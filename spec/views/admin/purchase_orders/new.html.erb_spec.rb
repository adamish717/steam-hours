require 'rails_helper'

RSpec.describe "admin/purchase_orders/new", :type => :view do
  before(:each) do
    assign(:purchase_order, PurchaseOrder.new(
      :title => "MyString",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders new purchase_order form" do
    render

    assert_select "form[action=?][method=?]", admin_purchase_orders_path, "post" do

      assert_select "input#purchase_order_title[name=?]", "purchase_order[title]"

      assert_select "input#purchase_order_active[name=?]", "purchase_order[active]"
    end
  end
end
