# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "a@a.a",first_name:"a",last_name: "a",gender: "male", address: "amsterdam", password:"123456")
User.create(email: "b@a.a",first_name:"b",last_name: "b",gender: "male", address: "amsterdam", password:"123456")
User.create(email: "c@a.a",first_name:"c",last_name: "c",gender: "male", address: "amsterdam", password:"123456")
User.create(email: "c@a.a",first_name:"d",last_name: "d",gender: "male", address: "amsterdam", password:"123456")


  challenge = Challenge.create!(
    name: "Marathon",
    duration: 7,
    xp: 50,
    description: "Instead of using your car everyday, try using your good old legs for a week!",
    emission_saving: 20
    )
  challenge.save!
