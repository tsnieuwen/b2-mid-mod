require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'instance methods' do
    it '#ordered_rides_by_thrill' do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18)


      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)


      expect(mechanic1.ordered_rides_by_thrill).to eq([ride1, ride4, ride2, ride3])

    end
  end
end
