150.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale created")
end 

puts "150 posts created"