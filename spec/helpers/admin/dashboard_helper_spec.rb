require 'rails_helper'

RSpec.describe Admin::DashboardHelper, :type => :helper do
  before do
    Timecop.freeze
  end

  after do
    Timecop.return
  end

  describe 'time_since_invite' do
    it 'tells when a user was invited' do
      user = User.invite!(email: 'valid@email.com')
      expect(time_since_invite(user)).to eq('Invited less than 1 second')
    end
  end
end
