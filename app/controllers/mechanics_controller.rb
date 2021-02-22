class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.ordered_rides_by_thrill
  end

  def update
    mechanic = Mechanic.find(params[:mechanic].to_i)
    ride = Ride.find(params[:ride].to_i)
    mechanic.rides << ride
    mechanic.save
    redirect_to "/mechanics/#{mechanic.id}"
  end

end
