require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  # describe 'instance methods' do
  #   it '#average_price_of_snacks' do
  #     owner1 = Owner.create(name: 'Tommy', id: 1)
  #     machine1 = Machine.create(location: 'Downtown', owner_id: 1)
  #     machine2 = Machine.create(location: 'Uptown', owner_id: 1)
  #     snack1 = Snack.create(name: 'Fritos', price: 3.45)
  #     snack2 = Snack.create(name: 'Oreos', price: 10.00)
  #     snack3 = Snack.create(name: 'Doritos', price: 2.50)
  #     snack4 = Snack.create(name: 'Crackers', price: 8.00)
  #     MachineSnack.create(machine: machine1, snack: snack1)
  #     MachineSnack.create(machine: machine1, snack: snack2)
  #     MachineSnack.create(machine: machine1, snack: snack3)
  #     MachineSnack.create(machine: machine1, snack: snack4)
  #
  #     expect(machine1.average_price_of_snacks).to eq(5.99)
  #
  #   end
  # end
end
