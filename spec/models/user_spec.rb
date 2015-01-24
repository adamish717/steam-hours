require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    let(:user) { FactoryGirl.create(:user) }

    it { should validate_presence_of :email }
    it { should allow_value('legit@email.com').for(:email) }
    it { should_not allow_value('noname.com').for(:email) }
    it { should_not allow_value('no@tld').for(:email) }

    it { should validate_presence_of :password }
    it { should validate_length_of :password }
    it { should validate_confirmation_of :password}

    it 'should create a new instance of a user given valid attributes' do
      user_attrs = FactoryGirl.attributes_for(:user)
      u = User.create!(user_attrs)
      expect(u).to be_valid
    end
  end
end
