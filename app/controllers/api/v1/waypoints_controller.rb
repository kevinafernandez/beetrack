module Api
  module V1
    class WaypointsController < ApplicationController
      def create
        WaypointWorker.perform_async(waypoint_params.to_json, vehicle_params)
      end

      private

      # strong_params && required formats
      def waypoint_params
        params.require(:waypoint).tap do |waypoint_params|
          waypoint_params.require(:latitude)
          waypoint_params.require(:longitude)
          waypoint_params.require(:sent_at)
        end
      end

      def vehicle_params
        params.require(:vehicle_identifier)
      end
    end
  end
end
