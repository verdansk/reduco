# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

marathon = Challenge.create!(
    name: "Marathon",
    duration: 7,
    xp: 50,
    description: "Instead of using your car everyday, try using your good old legs for a week!",
    emission_saving: 20
    )
  marathon.save!
  polar_bear = Challenge.create!(
    name: "Polar Bear",
    duration: 5,
    xp: 30,
    description: "Take Wim Hof's example and take your showers with cold water!",
    emission_saving: 10
    )
  polar_bear.save!
  leaf = Challenge.create!(
    name: "Herbivore",
    duration: 3,
    xp: 15,
    description: "For a few days try the vegetarian life!",
    emission_saving: 5
    )
  leaf.save!
  cleanup = Challenge.create!(
    name: "Recycle",
    duration: 1,
    xp: 10,
    description: "Clean up your closet and see which clothes are ready for recycling!",
    emission_saving: 5
    )
  cleanup.save!
  heater = Challenge.create!(
    name: "Campfire",
    duration: 6,
    xp: 45,
    description: "Instead of turning up the heat, put on some more clothing layers",
    emission_saving: 25
    )
  heater.save!
