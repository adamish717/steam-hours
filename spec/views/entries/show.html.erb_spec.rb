require 'rails_helper'

RSpec.describe "entries/show", :type => :view do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
    assign(:entry, @entry)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(@entry.description)
    expect(rendered).to include(@entry.parts_used)
  end
end
