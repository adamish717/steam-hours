require 'rails_helper'

RSpec.describe "Entries", :type => :request do
  before(:each) do
    login_user
  end

  describe "GET /entries" do
    it "works! (now write some real specs)" do
      get entries_path
      expect(response).to have_http_status(200)
    end
  end
end
