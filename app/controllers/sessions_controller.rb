class SessionsController < ApplicationController
  
 	def new
 		if !signed_in
  			@user = User.new
  		else
  			flash[:error] = 'vous etes deja connecte'
  			redirect_to root_path
  		end
  	end

  	def create
  		user = User.find_by(email: params[:session][:email])
  		if user && user.authenticate(params[:session][:password])
	  		log_in user
	  		flash[:notice] = 'vous etes maintenant connectee'
	  		redirect_to root_path
  		else
	  		flash[:error] = 'combinaison invalid'
	  		render 'new'
	  	end
  	end

	def destroy
		if signed_in
		  	log_out
		  	flash[:notice] = 'vous etes maintenant deconnecte'
		  	redirect_to root_path
		else
			flash[:error] = "veuillez vous connecte"
			redirect_to new_session_path
		end
	end
end
