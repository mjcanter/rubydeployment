class User < ApplicationRecord
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secrets
  validates :name, :presence => {:message => "Name can't be blank"}
  validates :email, :presence => {:message => "Email can't be blank"}
  validates :password, :presence => {:message => "Password can't be blank"}
end
