require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do
  let!(:admin) { login_admin }
  let!(:users) { FactoryGirl.create_list(:user, 5) }

  describe 'GET index' do
    it 'assigns all users as @users' do
      get :index
      expect(assigns(:users)).to match_array(users << admin)
    end
  end
end
