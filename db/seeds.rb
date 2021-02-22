# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



mechanic1 = Mechanic.create(name: 'Mo', years_experience: 18)
mechanic2 = Mechanic.create(name: 'Larry', years_experience: 10)
mechanic3 = Mechanic.create(name: 'Curly', years_experience: 2)

ride1 = Ride.create(name: 'Superman', thrill_rating: 9, open: true)
ride2 = Ride.create(name: 'Plunger', thrill_rating: 4, open: false)
ride3 = Ride.create(name: 'Tea Cups', thrill_rating: 1, open: false)
ride4 = Ride.create(name: 'Twister', thrill_rating: 7, open: true)
ride5 = Ride.create(name: 'See Saw', thrill_rating: 1, open: true)

MechanicRide.create(mechanic: mechanic1, ride: ride1)
MechanicRide.create(mechanic: mechanic2, ride: ride1)
MechanicRide.create(mechanic: mechanic3, ride: ride1)
MechanicRide.create(mechanic: mechanic2, ride: ride2)
MechanicRide.create(mechanic: mechanic3, ride: ride2)
MechanicRide.create(mechanic: mechanic3, ride: ride3)
MechanicRide.create(mechanic: mechanic1, ride: ride4)
MechanicRide.create(mechanic: mechanic3, ride: ride4)
MechanicRide.create(mechanic: mechanic1, ride: ride2)
MechanicRide.create(mechanic: mechanic1, ride: ride3)
