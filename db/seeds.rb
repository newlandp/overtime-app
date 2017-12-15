AdminUser.create!(first_name: "Admin",
                  last_name: "User",
                  email: "myadmin@example.com",
                  password: "secret",
                  password_confirmation: "secret",
                  phone: '2062717999')

puts "1 admin user created"

User.create!(first_name: "Paul",
             last_name: "Newland",
             email: "p@example.com",
             password: "secret",
             password_confirmation: "secret",
             phone: '2062717999')

User.create!(first_name: "Other",
             last_name: "User",
             email: "other@example.com",
             password: "secret",
             password_confirmation: "secret",
             phone: '2062717999')

puts "2 users created"

20.times do |post|
  if post % 2 == 0
    Post.create!(user_id: User.find_by(first_name: "Paul").id,
                 date: Date.today,
                 rationale: "#{post} rationale content",
                 overtime_request: 2.5)
  else
    Post.create!(user_id: User.find_by(first_name: "Other").id,
                 date: Date.today,
                 rationale: "#{post} rationale content",
                 overtime_request: 2.5)
  end
end

puts "20 posts have been created"

20.times do |audit_log|
  if audit_log % 2 == 0
    AuditLog.create!(user_id: User.find_by(first_name: "Paul").id,
                     status: 0,
                     start_date: (Date.today - 6.days))
  else
    AuditLog.create!(user_id: User.find_by(first_name: "Other").id,
                     status: 0,
                     start_date: (Date.today - 6.days))
  end
end

puts "20 audit logs have been created"