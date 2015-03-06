class User < ActiveRecord::Base
  devise :database_authenticatable, :invitable, :omniauthable, :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]
  has_many :entries

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    User.where(email: data['email']).first
  end

  def admin?
    !!admin
  end

  def pending_invitation?
    invited_to_sign_up? && !invitation_accepted?
  end
end
