class WaypointWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(waypoint_params, vehicle_params)
    waypoint_params = JSON.parse(waypoint_params) # convert string to JSON
    waypoint = Waypoint.new(waypoint_params.to_h)
    waypoint.assign_vehicle(vehicle_params)
    return unless waypoint.save # save waypoint include the vehicle assigned
  end

end
