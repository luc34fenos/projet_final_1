class PaniersController < ApplicationController

	def new
		
	end

	def create
		p = Command.create(user_id: params[:user_id],panier_id:  nbre_items: params[:nbre])
		p.posts = [Post.find(params[:posts_id])]
		p = Post.find(params[:posts_id])
		n = p.nombre
		p.update(nombre: (n.to_i - params[:nbre].to_i))
		redirect_to root_path
	end

	def show
		if signed_in
			@panier = Panier.where(id: current_user.id)
		else
			flash[:error] = "invalid"
			redirect_to log_path
		end
	end

end
