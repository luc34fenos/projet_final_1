class CommandsController < ApplicationController

	def destroy
		c = Command.find(params[:id])
		p = Post.find(c.post_id)
		n = p.nombre
		p.update(nombre: (n.to_i + c.nbre_items))
		Command.destroy(params[:id])
		flash[:notice] = "effacement reussie"
		redirect_to panier_path
	end

end