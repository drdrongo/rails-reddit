# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying existing users...'
User.destroy_all
puts 'All users destroyed.'

puts 'Creating 20 new users...'
20.times do
  user = User.new(
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 8),
    email: Faker::Internet.free_email
  )
  user.save
end
puts '20 new users created'
puts 'Seeding completed.'
