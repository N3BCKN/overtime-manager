class AuditLog < ApplicationRecord
  after_initialize :set_default_date
  belongs_to :user

  validates_presence_of  :status, :start_date

  private
  def set_default_date
  	self.start_date ||= Date.today - 6.days
  end  
end
