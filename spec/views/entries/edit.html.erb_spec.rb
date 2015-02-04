require 'rails_helper'

RSpec.describe "entries/edit", :type => :view do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "textarea#entry_description[name=?]", "entry[description]"

      assert_select "textarea#entry_parts_used[name=?]", "entry[parts_used]"

      assert_select "select#entry_purchase_order_id[name=?]", "entry[purchase_order_id]"
    end
  end
end
