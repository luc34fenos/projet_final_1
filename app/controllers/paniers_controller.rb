class PaniersController < ApplicationController

	def new
		
	end

	def create
		p = Post.find(params[:posts_id])
		nb = p.nombre.to_i
		if (nb >= params[:nbre].to_i) && (nb >= 0)
			if r = Command.where(post_id: params[:posts_id], panier_id: monpanierid).first
				h = r.nbre_items
				r.update(nbre_items: h.to_i + params[:nbre].to_i)
			else
				Command.create(panier_id: monpanierid,post_id: params[:posts_id], nbre_items: params[:nbre], price: prx(params[:posts_id], params[:nbre]))
			end
			p.update(nombre: (nb.to_i - params[:nbre].to_i))
		else
			flash[:error] = 'article manquant'
		end
		redirect_to panier_path(monpanierid)
	end

	def show
		if signed_in
			@command = Command.where(panier_id: monpanierid)
			@price = totalprix
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

	def prx(prm, nb = 1)
		p = Post.where(id: prm)
		return p[0].price * nb.to_i
	end

	def totalprix
		c = Command.where(panier_id: monpanierid)
		if c.length != 0
			a = 0
			c.each do |cprim|
				a += cprim.price
			end
			return a
		else
			return 0
		end
	end

end
