require 'rails_helper'

describe 'AuditLog Feature' do
	before do
	  admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      FactoryGirl.create(:audit_log)
	end

	describe 'navigation' do
		it 'should exist on index page' do
			visit audit_logs_path 
			expect(page.status_code).to eq(200)
		end

		it 'should contain audit_logs' do
			visit audit_logs_path
			expect(page).to have_content(/DOE/)
		end 
 	end

 	describe 'access' do
 		it 'should allow only admin to access it' do
 			logout(:user)
			user = FactoryGirl.create(:user)
			login_as(user, :scope => :user)

			visit audit_logs_path
			expect(current_path).to eq(root_path)
 		end 
 	end 
end 