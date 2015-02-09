require 'rails_helper'

RSpec.describe "entries/new", :type => :view do
  before(:each) do
    assign(:entry, Entry.new(
      :description => "MyText",
      :parts_used => "MyText",
      :purchase_order => nil
    ))
    assign(:clients, Client.all)
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "textarea#entry_description[name=?]", "entry[description]"

      assert_select "textarea#entry_parts_used[name=?]", "entry[parts_used]"

      assert_select "select#entry_purchase_order_id[name=?]", "entry[purchase_order_id]"
    end
  end
end
