# frozen_string_literal: true

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
      expect(@user.full_name).to eq('DOE, JOHN')
    end
  end

  describe 'relations' do
    it 'should allows for admins to be associeted with multiple users' do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user: admin, hand: employee_1)
      Hand.create!(user: admin, hand: employee_2)

      expect(admin.hands.count).to eq(2)
    end
  end
end
