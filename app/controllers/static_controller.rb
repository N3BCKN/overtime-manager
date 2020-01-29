# frozen_string_literal: true

class StaticController < ApplicationController
  before_action :check_user_type, only: [:homepage]
  def homepage; end

  private

  def check_user_type
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.where(status: 'submitted')
      @recent_audit_items = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end
end
