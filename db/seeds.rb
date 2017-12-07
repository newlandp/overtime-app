AdminUser.create!(first_name: "Admin", last_name: "User", email: "myadmin@example.com", password: "secret", password_confirmation: "secret")
User.create!(first_name: "Paul", last_name: "Newland", email: "p@example.com", password: "secret", password_confirmation: "secret")
User.create!(first_name: "Other", last_name: "User", email: "other@example.com", password: "secret", password_confirmation: "secret")
puts "1 admin user created"
puts "2 users created"

20.times do |post|
  if post % 2 == 0
    Post.create!(user_id: User.find_by(first_name: "Paul").id, date: Date.today, rationale: "#{post} rationale content")
  else
    Post.create!(user_id: User.find_by(first_name: "Other").id, date: Date.today, rationale: "#{post} rationale content")
  end
end
puts "20 posts have been created"