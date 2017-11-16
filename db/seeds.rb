User.create!(first_name: "Paul", last_name: "Newland", email: "p@example.com", password: "secret", password_confirmation: "secret")
puts "user created"

10.times do |post|
  Post.create!(user_id: User.first.id, date: Date.today, rationale: "#{post} rationale content")
end
puts "10 posts have been created"