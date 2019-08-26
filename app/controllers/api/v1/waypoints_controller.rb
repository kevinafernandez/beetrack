class Api::V1::WaypointsController < ApplicationController

  def create
    vehicle_identifier = params['vehicle_identifier'].upcase
    WaypointWorker.perform_async(waypoint_params.to_json, vehicle_identifier)
  end

  private

  # strong_params
  def waypoint_params
    params.require(:waypoint).permit(:latitude, :longitude, :sent_at)
  end
end
