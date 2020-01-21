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

    xit 'requires phone_number to only have integers' do
      @user.phone_number = 'qwertyuiop'
      expect(@user).to_not be_valid
    end

    xit 'requires phone_number to have only 10 digits' do
      @user.phone_number = '01234567891'
      expect(@user).to_not be_valid
    end
  end 

  describe 'custom methods' do
    it 'should combine first name and the last name together' do
      expect(@user.full_name).to eq("DOE, JOHN")
    end 
  end  
end
