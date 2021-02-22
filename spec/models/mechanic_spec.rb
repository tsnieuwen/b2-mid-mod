require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  # describe 'class methods' do
  #   it '#average_years_of_experience_mechanics' do
  #     mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18)
  #     mechanic2 = Mechanic.create(name: 'Larry', years_experience: 10)
  #     mechanic3 = Mechanic.create(name: 'Curly', years_experience: 2)
  #
  #     expect(Mechanic.average_years_of_experience_of_mechanics).to eq(15)
  #
  #   end
  # end
end
