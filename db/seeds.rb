# frozen_string_literal: true

@user = User.create!(
  email: 'test@test.com',
  password: 'qwerty',
  password_confirmation: 'qwerty',
  first_name: 'John',
  last_name: 'Doe',
  phone_number: '0123456789'
)

AdminUser.create!(
  email: 'test1@test.com',
  password: 'qwerty',
  password_confirmation: 'qwerty',
  first_name: 'Admin',
  last_name: 'Doe',
  phone_number: '0123456789'
)

150.times do |_post|
  Post.create!(date: Date.today, rationale: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
		incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
		ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
		voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
		sunt in culpa qui officia deserunt mollit anim id est laborum.", user: @user, overtime_request: 2.5)
end

puts '150 posts created'

AuditLog.create!(user: @user, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user: @user, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user: @user, status: 0, start_date: (Date.today - 20.days))

puts '150 posts audit logs'
