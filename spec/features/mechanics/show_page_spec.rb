# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit a mechanic show page' do
    it "displays the mechanics, name, years, of experience, and names of rides they're working on" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18, id: 1)

      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)
      visit '/mechanics/1'

      expect(page).to have_content("Mechanic: Mo")
      expect(page).to have_content("Years of experience: 18")
      expect(page).to have_content('Superman')
      expect(page).to have_content('Twister')
    end

    it "only displays rides that are currently open" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18, id: 1)

      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)
      visit '/mechanics/1'

      expect(page).to have_content('Superman')
      expect(page).to have_content('Twister')
      expect(page).to_not have_content('Plunger')
      expect(page).to_not have_content('Tea Cups')
    end

    it "lists rides based on their thrill rating in descending order" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18, id: 1)

      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)
      visit '/mechanics/1'

      expect('Superman').to appear_before('Twister')

    end
  end
end
