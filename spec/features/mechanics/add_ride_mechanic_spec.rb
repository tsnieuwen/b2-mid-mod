# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page

require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit a mechanic show page' do
    it "displays a form to add a ride to their workload, with a submit button" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18, id: 1)

      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)
      ride5 = Ride.create(name: 'See Saw', thrill_rating: 1, open: true)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)
      visit '/mechanics/1'

      expect(page).to have_content("Add a ride to their workload")
      expect(page).to have_content("Ride Id:")
      expect(page).to have_button("Submit")
    end
  end

  describe 'when I fill in the field with an id of an exisitng ride and hit submit' do
    it 'redirects me to the mechanics show page, where I see the name of that newly added ride' do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18, id: 1)

      ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true, id: 1)
      ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false, id: 2)
      ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false, id: 3)
      ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true, id: 4)
      ride5 = Ride.create(name: 'See Saw', thrill_rating: 1, open: true, id: 5)

      MechanicRide.create(mechanic: mechanic1, ride: ride1)
      MechanicRide.create(mechanic: mechanic1, ride: ride2)
      MechanicRide.create(mechanic: mechanic1, ride: ride3)
      MechanicRide.create(mechanic: mechanic1, ride: ride4)

      visit '/mechanics/1'

      fill_in(:ride, with: 5)
      click_button('Submit')
      expect(page).to have_current_path('/mechanics/1')
      expect(page).to have_content('See Saw')
      expect('Superman').to appear_before('Twister')
      expect('Twister').to appear_before('See Saw')
    end
  end
end
