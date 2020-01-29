class Post < ApplicationRecord
	enum status: { submitted: 0, approved: 1, rejected: 2 }
	belongs_to :user
	validates_presence_of :date,:rationale, :overtime_request

	validates :overtime_request, numericality: { greater_than: 0.0}

	scope :post_by, -> (user) { where(user_id: user.id)}

	after_save :update_audit_log, if: :submitted?
	after_save :un_confirm_audit_log, if: :rejected?
	private 
	def update_audit_log
		audit_log = AuditLog.where(user: self.user, start_date: (self.date - 7.days..self.date)).last
		audit_log.confirmed! if audit_log
	end
	def un_confirm_audit_log
		audit_log = AuditLog.where(user: self.user, start_date: (self.date - 7.days..self.date)).last
		audit_log.pending! if audit_log
	end
end
