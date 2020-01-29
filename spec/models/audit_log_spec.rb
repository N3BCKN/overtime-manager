# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit = FactoryGirl.create(:audit_log)
  end

  describe 'creation' do
    it 'should be creared' do
      expect(@audit).to be_valid
    end
  end

  describe 'validation' do
    it 'should have user related to id' do
      @audit.user = nil
      expect(@audit).to_not be_valid
    end

    it 'should always has a status' do
      @audit.status = nil
      expect(@audit).to_not be_valid
    end

    it 'should have start_date' do
      @audit.start_date = nil
      expect(@audit).to_not be_valid
    end

    it 'should have a start_date = 6.days prior' do
      another_audit = AuditLog.create(user: User.last)
      expect(another_audit.start_date).to eq(Date.today - 6.days)
    end
  end
end
