require 'rails_helper'

RSpec.describe "purchase_orders/edit", :type => :view do
  before(:each) do
    @purchase_order = FactoryGirl.create(:purchase_order)
  end

  it "renders the edit purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_order_path(@purchase_order), "post" do

      assert_select "input#purchase_order_title[name=?]", "purchase_order[title]"

      assert_select "textarea#purchase_order_description[name=?]", "purchase_order[description]"

      assert_select "input#purchase_order_active[name=?]", "purchase_order[active]"
    end
  end
end
