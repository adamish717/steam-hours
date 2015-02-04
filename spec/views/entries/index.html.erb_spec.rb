require 'rails_helper'

RSpec.describe "entries/index", :type => :view do
  before(:each) do
    @entries = FactoryGirl.create_list(:entry, 2)
    assign(:entries, @entries)
  end

  it "renders a list of entries" do
    render
    assert_select 'tbody>tr', :count => 2
    expect(rendered).to include(@entries.first.description)
    expect(rendered).to include(@entries.first.parts_used)
  end
end
