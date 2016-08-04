class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :vehicles
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create


end
