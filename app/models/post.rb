# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request

  validates :overtime_request, numericality: { greater_than: 0.0 }

  scope :post_by, ->(user) { where(user_id: user.id) }

  after_save :update_audit_log, if: :submitted?
  after_save :un_confirm_audit_log, if: :rejected?

  private

  def update_audit_log
    audit_log = AuditLog.where(user: user, start_date: (date - 7.days..date)).last
    audit_log&.confirmed!
  end

  def un_confirm_audit_log
    audit_log = AuditLog.where(user: user, start_date: (date - 7.days..date)).last
    audit_log&.pending!
  end
end
