class HomeController < ApplicationController

  def show
    @waypoints = Waypoint.most_recents
  end

end
