class Vehicle < ApplicationRecord
  has_many :waypoints

  validates :identifier, uniqueness: { case_sensitive: false }
end
