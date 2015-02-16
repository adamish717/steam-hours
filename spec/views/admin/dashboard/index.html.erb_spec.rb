require 'rails_helper'

RSpec.describe '/admin/dashboard/index', :type => :view do
  before(:each) do
    @users = FactoryGirl.create_list(:user, 5)
  end

  it 'renders a list of users' do
    render
    assert_select 'dl>dt', :count => 5
    expect(rendered).to include(@users.first.email)
  end
end
