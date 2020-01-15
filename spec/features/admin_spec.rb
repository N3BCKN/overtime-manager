require 'rails_helper'

describe 'admin dashboard' do
	it 'can be reached succesfully' do
		visit admin_root_path
		expect(page.status_code).to eq(200)
	end 

	it 'does not allow users to access without being signed in' do
	    visit admin_root_path
	    expect(current_path).to eq(new_user_session_path)
	end

	it 'should not access non admin users' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		visit admin_root_path
		expect(current_path).to eq(root_path)
	end 

	it 'should give access for admin users' do
		user = FactoryGirl.create(:admin_user)
		login_as(user, :scope => :user)

		visit admin_root_path
		expect(current_path).to eq(admin_root_path)
	end 

end 