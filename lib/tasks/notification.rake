# frozen_string_literal: true

namespace :notification do
  desc 'Send SMS notification to employees asking them to log if they have overtime'
  task sms: :environment do
  end

  desc 'Sends mail notification to managers (admin users) each day to inform of pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
