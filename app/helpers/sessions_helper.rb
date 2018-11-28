module SessionsHelper

	def log_in(user)
		session[:id] = user.id
	end
	

	def current_user
		current_user = signed_in ? User.find(session[:id]) : nil
	end

	def signed_in
		!session[:id].nil?
	end

	def log_out
		current_user = nil
		session.delete(:id)
	end

	def root
		return signed_in ? (current_user.admin == true) : false
	end

end
