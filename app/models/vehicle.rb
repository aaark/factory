class Vehicle < ApplicationRecord
  FUEL = %w(Petrol Diesel CNG)
  TYPE_NAME= ['sedan', 'truck']
  validates :color, presence: true
  validates :st_date, presence: true
  validates :del_date, presence: true
  validates :color, presence: true
  validates :power_rating, inclusion: {in:  0..90}
  has_and_belongs_to_many :users
end
