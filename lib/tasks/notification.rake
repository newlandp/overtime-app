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

end
