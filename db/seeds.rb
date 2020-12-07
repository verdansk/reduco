marathon = Challenge.create!(
    name: "Marathon",
    duration: 7,
    xp: 50,
    description: "Instead of using your car everyday, try using your good old legs for a week!",
    emission_saving: 20,
    image: "walking.svg"
    )
  polar_bear = Challenge.create!(
    name: "Polar Bear",
    duration: 5,
    xp: 30,
    description: "Take Wim Hof's example and take your showers with cold water!",
    emission_saving: 10,
    image: "polarbear.svg"
    )
  leaf = Challenge.create!(
    name: "Herbivore",
    duration: 3,
    xp: 15,
    description: "For a few days try the vegetarian life!",
    emission_saving: 5,
    image: "herbivore.png"
    )
  cleanup = Challenge.create!(
    name: "Recycle",
    duration: 1,
    xp: 10,
    description: "Clean up your closet and see which clothes are ready for recycling!",
    emission_saving: 5,
    image: "recycle.svg"
    )
  heater = Challenge.create!(
    name: "Campfire",
    duration: 6,
    xp: 45,
    description: "Instead of turning up the heat, put on some more clothing layers",
    emission_saving: 25,
    image: "campfire.png"
    )
