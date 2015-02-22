require 'rails_helper'

RSpec.describe 'clients/index', :type => :view do
  before(:each) do
    @clients = FactoryGirl.create_list(:client, 2)
    assign(:clients, @clients)
  end

  it 'renders a list of clients' do
    render
    decoded = decode rendered
    assert_select 'tbody>tr', :count => 2
    expect(decoded).to include(@clients.first.name)
  end
end
