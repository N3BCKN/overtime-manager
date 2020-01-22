require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe 'creation' do
  	it 'can be created' do
  		expect(@user).to be_valid
  	end
  end

  describe 'validation' do
    it 'cannot be created without first_name' do
      @user.first_name = nil

      expect(@user).to_not be_valid
    end

    it 'cannot be created without last_name' do
      @user.last_name = nil
      
      expect(@user).to_not be_valid
    end

    it 'cannot be created without phone_number' do
      @user.phone_number = nil
      
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only contain integers' do
      @user.phone_number = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only have 10 chars' do
      @user.phone_number = '12345678901'
      expect(@user).to_not be_valid
    end
  end 

  describe 'custom methods' do
    it 'should combine first name and the last name together' do
      expect(@user.full_name).to eq("DOE, JOHN")
    end 
  end  
end
