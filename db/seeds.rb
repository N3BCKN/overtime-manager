User.create!(email: "test@test.com", password: "qwerty", password_confirmation: "qwerty", first_name: "John", last_name: "Doe")


150.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale created", user: User.last)
end 

puts "150 posts created"