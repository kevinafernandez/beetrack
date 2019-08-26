class WaypointWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(waypoint_params, vehicle_identifier)
    waypoint_params = JSON.parse(waypoint_params)
    waypoint = Waypoint.new(waypoint_params.to_h)
    waypoint.assign_vehicle(vehicle_identifier)
    return unless waypoint.save # save waypoint include the vehicle associated
  end

end



