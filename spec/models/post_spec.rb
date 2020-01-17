require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
  	before do
      user = FactoryGirl.create(:user)
  		@post = FactoryGirl.create(:post)
  	end 

  	it 'can be created' do
  		expect(@post).to be_valid
  	end

  	it 'cannot be created without date and rationale and overtime_request' do
  		@post.rationale = nil
  		@post.date = nil
      @post.overtime_request = nil
  		expect(@post).to_not be_valid
  	end

    it 'has overtime_request greater then 0.0' do
      @post.overtime_request = 0.0
      expect(@post).to_not be_valid
    end
  end 
end
