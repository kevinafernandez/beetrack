class Vehicle < ApplicationRecord
  has_many :waypoints

  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
end
