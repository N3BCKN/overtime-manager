namespace :notification do
  desc "Send SMS notification to employees asking them to log if they have overtime"
  task sms: :environment do
  	puts "Im in the rake task"
  end

end
