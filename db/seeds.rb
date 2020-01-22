User.create!(
	email: "test@test.com", 
	password: "qwerty", 
	password_confirmation: "qwerty", 
	first_name: "John", 
	last_name: "Doe",
	phone_number: "0123456789")

AdminUser.create!(
	email: "test1@test.com", 
	password: "qwerty", 
	password_confirmation: "qwerty", 
	first_name: "Admin", 
	last_name: "Doe",
	phone_number: "0123456789")


150.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale created", user: User.first, overtime_request: 2.5)
end 

puts "150 posts created"

150.times do |audit_log|
	AuditLog.create!(user: User.last, status: 0, start_date: (Date.today - 6.days))
end


puts "150 posts audit logs"