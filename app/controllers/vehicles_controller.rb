class VehiclesController < ApplicationController

  def show
    @vehicles = Vehicle.all
  end

end
