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
    description: "Instead of turning up the heat, put on some more clothing layers.",
    emission_saving: 25,
    image: "campfire.png"
    )
  zero_plastic = Challenge.create!(
    name: "No-Plastic",
    duration: 5,
    xp: 35,
    description: "While doing groceries avoid buying anything wrapped in plastic.",
    emission_saving: 25,
    image: "no-plastic.png"
    )
   separate = Challenge.create!(
    name: "Sort waste",
    duration: 7,
    xp: 45,
    description: "For a week sort your waste into different categories (glass, paper, plastic)",
    emission_saving: 25,
    image: "recycling.png"
    )
    trashpicker = Challenge.create!(
    name: "Cleanup",
    duration: 1,
    xp: 35,
    description: "Arm yourself with a trash picker and clean up your neighbourhood!",
    emission_saving: 25,
    image: "paper-bin.png"
    )
    carpool = Challenge.create!(
    name: "Carpool",
    duration: 5,
    xp: 35,
    description: "Sometimes using a car can't be avoided, but find someone to carpool with to lower your emissions and expenses!",
    emission_saving: 25,
    image: "eco-car.png"
    )
    plant = Challenge.create!(
    name: "Plant a Tree",
    duration: 1,
    xp: 25,
    description: "Trees are being chopped down at a crazy rate, time to fight back, plant a tree!",
    emission_saving: 25,
    image: "ecology.png"
    )
