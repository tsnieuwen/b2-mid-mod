class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def ordered_rides_by_thrill
    rides.order(thrill_rating: :desc)
  end

end
