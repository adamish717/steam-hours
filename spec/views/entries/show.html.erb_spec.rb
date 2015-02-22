require 'rails_helper'

RSpec.describe "entries/show", :type => :view do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
    assign(:entry, @entry)
  end

  it "renders attributes in <p>" do
    render
    decoded = decode rendered
    expect(decoded).to include(@entry.description)
    expect(decoded).to include(@entry.parts_used)
  end
end
