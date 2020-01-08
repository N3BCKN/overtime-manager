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
		it 'should reach the form page' do
			visit new_post_path
			expect(page.status_code).to eq(200)
		end

		it 'should be able to create new post' do
			visit new_post_path

			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "New Rationale"

			click_on "Save"
			expect(page).to have_content("New Rationale")
		end 
	end
end 