class PostsController < ApplicationController

  def new
  	@post = Post.new
  	@cat = Category.all
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :description, :nombre, :price, :img))
    post.category = Category.find_by(title: params[:post][:category])
  	if post.valid?
      post.save
  		flash[:notice] = "article ajoutee avec succes"
  		redirect_to root_path
  	else
  		flash[:error] = 'donne invalid'
  		redirect_to new_post_path
  	end
  end

  def edit
    @post = Post.find(params[:id])
    @cat = Category.all
  end

  def update
     post = Post.find(params[:id])
    if signed_in && root
      post.update(params.require(:post).permit(:title, :description, :nombre, :price, :img))
      if post.valid?
        post.save
        flash[:notice] = "mise a jours reussie"
        redirect_to root_path
      else
        flash[:error] = "donnee invalid"
        render 'edit'
      end
    else
      flash[:error] = "vous n'etes pas autorisee a faire cette modification"
      redirect_to root_path
    end
  end

  def destroy
    if signed_in && root
      Post.destroy(params[:id])
      flash[:notice] = "effacer avec succes"
      redirect_to root_path
    else
      flash[:error] = "vous n'etes pas autorisee a faire cette modification"
      redirect_to root_path
    end
  end

end
