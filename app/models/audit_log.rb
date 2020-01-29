# frozen_string_literal: true

class AuditLog < ApplicationRecord
  after_initialize :set_default_date
  enum status: { pending: 0, confirmed: 1 }
  belongs_to :user

  validates_presence_of :status, :start_date

  before_update :set_end_date, if: :confirmed?

  private

  def set_default_date
    self.start_date ||= Date.today - 6.days
  end

  def set_end_date
    self.end_date = Date.today
  end
end
