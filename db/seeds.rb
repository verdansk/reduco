# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





  challenge = Challenge.create!(
    name: "Marathon",
    duration: 7,
    xp: 50,
    description: "Instead of using your car everyday, try using your good old legs for a week!",
    emission_saving: 20
    )
  challenge.save!
