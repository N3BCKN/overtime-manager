require 'rails_helper'

describe 'navigate' do
	describe 'index' do
		it 'should reach index page' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it 'should have content' do
			visit posts_path
			expect(page).to have_content(/Posts/)
		end
	end
	describe 'creation' do
		before do
			@user = User.create(email: "test1@test.com", password: "qwerty", password_confirmation: "qwerty", first_name: "John", last_name: "Doe")
			login_as(@user, :scope => :user)
			visit new_post_path
		end

		it 'should reach the form page' do
			visit new_post_path
			expect(page.status_code).to eq(200)
		end

		it 'should be able to create new post' do

			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "New Rationale"

			click_on "Save"
			
			expect(page).to have_content("New Rationale")
		end

		it 'should have user assosiated with' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Rationale %$^!%*&VDDF"

			click_on "Save"
			expect(User.last.posts.last.rationale).to eq("Rationale %$^!%*&VDDF")
		end 
	end
end 