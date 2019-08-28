class Waypoint < ApplicationRecord
  belongs_to :vehicle

  validates_presence_of :latitude, :longitude, :sent_at

  scope :most_recents, -> { select('DISTINCT on (vehicle_id) waypoints.*').order('vehicle_id, sent_at DESC') }

  def assign_vehicle(identifier)
    vehicle = Vehicle.find_or_create_by(identifier: identifier)
    self.vehicle = vehicle
  end

  def vehicle_identifier
    vehicle.identifier
  end

end
