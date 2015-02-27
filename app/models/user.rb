class User < ActiveRecord::Base
  devise :database_authenticatable, :invitable, :omniauthable, :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]
  has_many :entries

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
    end
    user
  end
end
