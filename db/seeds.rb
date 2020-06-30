def populate_comments(user, post)
  rand(0..2).times do
    comment = Comment.new(
      content: Faker::TvShows::MichaelScott.quote
    )
    comment.user = user
    comment.post = post
    comment.save
  end
end

def populate_posts(user)
  rand(0..10).times do
    post = Post.new(
      title: Faker::Hacker.noun,
      content: Faker::Hacker.say_something_smart
    )
    post.user = user
    post.save
    populate_comments(user, post)
  end
end

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
  populate_posts(user)
end
puts '20 new users created'
puts 'Seeding completed.'
