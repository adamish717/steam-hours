class User < ActiveRecord::Base
  devise :database_authenticatable, :invitable, :recoverable, :rememberable, :trackable, :validatable
  has_many :entries
end
