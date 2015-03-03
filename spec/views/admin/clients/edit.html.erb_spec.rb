require 'rails_helper'

RSpec.describe "admin/clients/edit", :type => :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", admin_client_path(@client), "post" do

      assert_select "input#client_name[name=?]", "client[name]"

    end
  end
end
