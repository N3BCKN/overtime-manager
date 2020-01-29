# frozen_string_literal: true

class AuditLogsController < ApplicationController
  before_action :set_audit_log, only: [:confirm]
  def index
    @audit_logs = AuditLog.all.page(params[:page]).per(10)
    authorize @audit_logs
    respond_to do |format|
      format.js { render 'index.js.erb' }
      format.html
    end
  end

  def confirm
    authorize @audit_log
    @audit_log.confirmed!
    redirect_to root_path, notice: 'Your confirmation has been successfull, thank you'
  end

  private

  def set_audit_log
    @audit_log = AuditLog.find(params[:id])
  end
end
