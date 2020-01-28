class ManagerMailer < ApplicationMailer
	def request(manager)
		@manager = manager
		mail(to: @manager.email, subject: "Daily overtime requests")
end
