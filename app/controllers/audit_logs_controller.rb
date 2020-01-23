class AuditLogsController < ApplicationController
	def index
		@audit_logs = AuditLog.all.page(params[:page]).per(10)
		authorize @audit_logs
		respond_to do |format|
	    	format.js  { render 'index.js.erb' }
	    	format.html
	  	end
	end
end
