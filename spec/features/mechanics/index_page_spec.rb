# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the mechanics index page' do
    it "displays a header saying 'All Mechanics'" do

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end

    it "lists all mechanic's names and their years of experience" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18)
      mechanic2 = Mechanic.create(name: 'Larry', years_experience: 10)
      mechanic3 = Mechanic.create(name: 'Curly', years_experience: 2)

      visit '/mechanics'

      expect(page).to have_content('Mo, 18 years of experience')
      expect(page).to have_content('Larry, 10 years of experience')
      expect(page).to have_content('Curly, 2 years of experience')
    end

    it "lists average years of experience across all mechanics" do
      mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18)
      mechanic2 = Mechanic.create(name: 'Larry', years_experience: 10)
      mechanic3 = Mechanic.create(name: 'Curly', years_experience: 2)

      visit '/mechanics'

      expect(page).to have_content('Average years of experience: 10')
    end
  end

  #   it "shows the average price of all the snacks in that machine" do
  #     owner1 = Owner.create(name: 'Tommy', id: 1)
  #     machine1 = Machine.create(location: 'Downtown', owner_id: 1)
  #     snack1 = Snack.create(name: 'Fritos', price: 3.45)
  #     snack2 = Snack.create(name: 'Oreos', price: 10.00)
  #     snack3 = Snack.create(name: 'Doritos', price: 2.50)
  #     snack4 = Snack.create(name: 'Crackers', price: 8.00)
  #     MachineSnack.create(machine: machine1, snack: snack1)
  #     MachineSnack.create(machine: machine1, snack: snack2)
  #     MachineSnack.create(machine: machine1, snack: snack3)
  #     MachineSnack.create(machine: machine1, snack: snack4)
  #
  #
  #     visit '/machines/1'
  #
  #     expect(page).to have_content('Average Price: $5.99')
  #   end
  # end
end
