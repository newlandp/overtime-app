User.create!(first_name: "Paul", last_name: "Newland", email: "p@example.com", password: "secret", password_confirmation: "secret")
User.create!(first_name: "Other", last_name: "User", email: "other@example.com", password: "secret", password_confirmation: "secret")
puts "2 users created"

20.times do |post|
  if post % 2 == 0
    Post.create!(user_id: User.first.id, date: Date.today, rationale: "#{post} rationale content")
  else
    Post.create!(user_id: User.last.id, date: Date.today, rationale: "#{post} rationale content")
  end
end
puts "20 posts have been created"