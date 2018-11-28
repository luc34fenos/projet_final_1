class UserMailer < ApplicationMailer

	def confirm(user)
		@user = user
		mail(to: user.email, subject: "confirmation de compte")
	end

end
