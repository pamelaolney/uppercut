# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LongGoal.destroy_all
ShortGoal.destroy_all

d1 = Date.new(2017, 9, 1)
d2 = Date.new(2016, 11, 30)
d3 = Date.new(2017, 1, 30)
d3 = Date.new(2016, 9, 20)


freedom = LongGoal.create(
  goal: 'Become debt free',
  duedate: d1,
  image_url: 'http://p.vitalmtb.com/photos/users/10218/photos/51170/s1600_GD022312.jpg?1362674349'
)

paythousand = ShortGoal.create(
  goal: 'Pay off $1,000.',
  scheduled_date: d2,
  location: 'Online',
  long_goal: freedom
)

weightloss = LongGoal.create(
  goal: 'Lose 10lbs',
  duedate: d3,
  image_url: 'https://s-media-cache-ak0.pinimg.com/236x/40/14/77/4014771f9fe70904fa3b1bc5d5e73d64.jpg'
)

join = ShortGoal.create(
  goal: 'Join a gym',
  scheduled_date: d2,
  location: 'Lifetime Fitness',
  long_goal: weightloss
)
