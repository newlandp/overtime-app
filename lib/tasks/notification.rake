namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # schedule to run every sunday at 5pm
    # iterate over all employees
    # skip admin users
    # send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms(user.phone_number, 'message')
    # end
  end

  desc "Sends email notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count < 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end

end
