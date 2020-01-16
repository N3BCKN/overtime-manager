FactoryGirl.define do
	sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'John'
    last_name 'Doe'
    email { generate :email }
    password "123456QW"
    password_confirmation "123456QW"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "123456QW"
    password_confirmation "123456QW"
  end

    factory :non_authorized_user, class: "User" do
    first_name 'not authozied'
    last_name 'User'
    email { generate :email }
    password "123456QW"
    password_confirmation "123456QW"
  end
end