class Customer < ActiveRecord::Base
  has_many :meal_kits
  has_secure_password
  validates_presence of :username, :email, :customer



end
