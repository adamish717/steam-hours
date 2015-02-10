require 'rails_helper'

include EntriesHelper

RSpec.describe "entries/index", :type => :view do
  before(:each) do
    @pay_period = pay_period(Date.current)
    @entries = FactoryGirl.create_list(:entry, 2)
    assign(:entries, @entries)
    @entry = Entry.new
    assign(:entry, @entry)
    assign(:clients, Client.all)
  end

  it "renders a list of entries" do
    render
    assert_select 'tbody>tr', :count => 2
    expect(rendered).to include(@entries.first.description)
    expect(rendered).to include(@entries.first.purchase_order.title)
    expect(rendered).to include(@entries.first.client.name)
    duration = @entries.first.end_at - @entries.first.start_at
    expect(rendered).to include(hours(duration))
  end
end
