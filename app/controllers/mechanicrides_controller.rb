class MechanicRidesController < ApplicationController

  def create
    mechanic_ride = MechanicRide.new(mechanic_id: params[:mechanic].to_i, ride: params[:ride].to_i)
    mechanic_ride.save
    redirect_to "/mechanics/#{params[:mechanic].to_i}"
  end

end
