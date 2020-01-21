User.create!(
	email: "test@test.com", 
	password: "qwerty", 
	password_confirmation: "qwerty", 
	first_name: "John", 
	last_name: "Doe")

AdminUser.create!(
	email: "test1@test.com", 
	password: "qwerty", 
	password_confirmation: "qwerty", 
	first_name: "Admin", 
	last_name: "Doe")


150.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale created", user: User.first, overtime_request: 2.5)
end 

puts "150 posts created"