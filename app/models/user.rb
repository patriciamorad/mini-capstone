class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true 
  has_many :orders 
  has_many :carted_products
end
