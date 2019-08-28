class HomeController < ApplicationController
  def show
    # find the most recents waypoints per vehicle
    @waypoints = Waypoint.most_recents
  end
end
