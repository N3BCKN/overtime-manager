require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(email: 'test123@tests.com', 
    password: '123456QW', 
    password_confirmation: '123456QW',
    first_name: "John",
    last_name: "Doe")
  end

  describe 'creation' do
  	it 'can be created' do
  		expect(@user).to be_valid
  	end 

  	it 'cannot be created without first_name, email and last_name' do
  		@user.first_name = nil
  		@user.last_name = nil

  		expect(@user).to_not be_valid
  	end
  end

  describe 'custom methods' do
    it 'should combine first name and the last name together' do
      expect(@user.full_name).to eq("DOE, JOHN")
    end 
  end  
end
