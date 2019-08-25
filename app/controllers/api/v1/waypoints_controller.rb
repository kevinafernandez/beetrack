class WaypointsController < ApplicationController

  def create
    x
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def waypoint_params
    params.require(:waypoint).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
  end

end
