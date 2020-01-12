require 'rails_helper'

describe 'navigate' do
	before do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
	end

	describe 'index' do
		it 'should reach index page' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it 'should have content' do
			visit posts_path
			expect(page).to have_content(/Posts/)
		end

		# it 'should listed posts on site' do
		# 	post1 = FactoryGirl.create(:post)
		# 	post2 = FactoryGirl.create(:second_post)
		# 	visit posts_path
		# 	expect(page).to have_content(/Post1|Post2/)
		# end 
	end
	describe 'creation' do
		before do
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

	describe 'new' do 
		it 'should has a link on homepage' do
			visit root_path

			click_link("new_post_from_nav")
			expect(page.status_code).to eq(200)
		end 
	end 

	describe 'delete' do
		it 'can be deleted' do
			@post = FactoryGirl.create(:post)
			visit posts_path

			click_link("delete_post_#{@post.id}_from_index")
			expect(page.status_code).to eq(200)
		end 
	end 

	describe 'edition' do
		before do 
			@post = FactoryGirl.create(:post)
		end 

		it 'should reach edit post section' do

			visit posts_path
			click_link("Edit")
			expect(page.status_code).to eq(200	)
		end

		it 'should edit post' do
			visit edit_post_path(@post)

			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Rationale Edited"

			click_on "Save"
			expect(page).to have_content("Rationale Edited")

		end 
	end 
end 