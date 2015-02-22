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
    decoded = decode rendered
    assert_select 'tbody>tr', :count => 2
    expect(decoded).to include(@entries.first.description)
    expect(decoded).to include(@entries.first.purchase_order.title)
    expect(decoded).to include(@entries.first.client.name)
    duration = @entries.first.end_at - @entries.first.start_at
    expect(decoded).to include(distance_of_time_in_words(duration))
  end
end
