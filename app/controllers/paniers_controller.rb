class PaniersController < ApplicationController

	def new
		
	end

	def create

		Command.create(panier_id: monpanierid,post_id: params[:posts_id], nbre_items: params[:nbre], price: prx(params[:posts_id]))
		p = Post.find(params[:posts_id])
		n = p.nombre
		p.update(nombre: (n.to_i - params[:nbre].to_i))
		redirect_to root_path
	end

	def show
		if signed_in
			@command = Command.where(panier_id: monpanierid)
			
		else
			flash[:error] = "invalid"
			redirect_to log_path
		end
	end
	
	def delete
		if signed_in
			Command.destroy(params[:id])
			flash[:notice] = "effacer du panier"
			render 'show'
		else
			flash[:error] = "invalid"
			redirect_to log_path
		end
	end

	private

	def monpanierid
		return Panier.find_by(user_id: current_user.id).id
	end

	def prx(prm)
		b=0
		p = Post.where(id: prm)
		p.each do |g|
			b += g.price
		end
		return b
	end
=begin
	def prix
		a = 0
		c = Command.where(panier_id: monpanierid)
		c.each do |f|
			a += c.price
		end
		return a
	end
=end

end
