class Vehicle < ApplicationRecord
  belongs_to :engine
  belongs_to :vehicle_type
  has_and_belongs_to_many :users
end
