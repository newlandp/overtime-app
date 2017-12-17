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
                 rationale: "#{post} Rationale. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum maximus massa non dictum. Quisque eu mauris mauris. Maecenas laoreet in dui id cursus. Cras ut imperdiet sem. Integer metus libero, gravida faucibus tortor in, dignissim tristique justo. Donec quis enim non tortor pharetra lobortis. Curabitur iaculis imperdiet massa, eu mollis turpis feugiat a. Praesent vehicula tellus lacus, ac vestibulum augue pellentesque at. Etiam congue ligula nec ipsum vestibulum, eu aliquam nulla porttitor. Duis mollis ultrices dolor, quis semper est consectetur sit amet. Mauris sit amet feugiat massa. Fusce rutrum mauris quam, quis auctor augue volutpat eu. Aenean tincidunt malesuada neque nec vehicula. Proin ac velit in mi bibendum egestas eget in mauris.",
                 overtime_request: 2.5)
  else
    Post.create!(user_id: User.find_by(first_name: "Other").id,
                 date: Date.today,
                 rationale: "#{post} Rationale. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum maximus massa non dictum. Quisque eu mauris mauris. Maecenas laoreet in dui id cursus. Cras ut imperdiet sem. Integer metus libero, gravida faucibus tortor in, dignissim tristique justo. Donec quis enim non tortor pharetra lobortis. Curabitur iaculis imperdiet massa, eu mollis turpis feugiat a. Praesent vehicula tellus lacus, ac vestibulum augue pellentesque at. Etiam congue ligula nec ipsum vestibulum, eu aliquam nulla porttitor. Duis mollis ultrices dolor, quis semper est consectetur sit amet. Mauris sit amet feugiat massa. Fusce rutrum mauris quam, quis auctor augue volutpat eu. Aenean tincidunt malesuada neque nec vehicula. Proin ac velit in mi bibendum egestas eget in mauris.",
                 overtime_request: 2.5)
  end
end

puts "20 posts have been created"

2.times do |audit_log|
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

2.times do |audit_log|
  if audit_log % 2 == 0
    AuditLog.create!(user_id: User.find_by(first_name: "Paul").id,
                     status: 0,
                     start_date: (Date.today - 13.days))
  else
    AuditLog.create!(user_id: User.find_by(first_name: "Other").id,
                     status: 0,
                     start_date: (Date.today - 13.days))
  end
end

2.times do |audit_log|
  if audit_log % 2 == 0
    AuditLog.create!(user_id: User.find_by(first_name: "Paul").id,
                     status: 0,
                     start_date: (Date.today - 20.days))
  else
    AuditLog.create!(user_id: User.find_by(first_name: "Other").id,
                     status: 0,
                     start_date: (Date.today - 20.days))
  end
end

puts "6 audit logs have been created"





