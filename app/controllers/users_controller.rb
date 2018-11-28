class UsersController < ApplicationController
  
  def new
  	@user = User.new
  	@user.valid?
  end

  def create
  	user = User.new(params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmarion))
  	if user.valid?
  	  user.save
  	  UserMailer.confirm(user).deliver_now
  	  flash[:notice] = "votre compte a ete creer avec succes, veuilez confirmer votre compte"
  	  redirect_to root_path
  	else
  	  flash[:error] = "donne invalid"
  	  redirect_to new_user_path
  	end  		
  end

  def confirm
  	if user = User.find(params[:id])
  		if user.confirmation_token == params[:token]
  			flash[:notice] = "confiramtion reussie"
        Panier.create(user_id: user.id)
  			user.update(confirmed: true, confirmation_token: nil)
  			user.save(validate: false)
  			redirect_to root_path
  		else
  			flash[:error] = "ce token semble invalid"
  			redirect_to new_user_path
  		end
  	else
  		flash[:error] = 'utilisateur introuvable'
  		redirect_to new_user_path
  	end
  end

  def show
    if signed_in
      @user = current_user
    else
      flash[:error] = "vous devez vous connecter"
      redirect_to log_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if signed_in && current_user.authenticate(params[:user][:password])
      user.update(params.require(:user).permit(:firstname, :lastname, :email))
      if user.valid?
        user.save
        flash[:notice] = "mise a jours reussie"
        redirect_to user_path(current_user.id)
      else
        flash[:error] = "donnee invalid"
        render 'edit'
      end
    else
      flash[:error] = "mot de passe incorrect"
      render "edit"
    end
  end

  def destroy
    if signed_in
      User.destroy(params[:id])
      flash[:notice] = "effacer avec succes"
      redirect_to root_path
    else
      flash[:error] = "vous n'etes pas autorisee a faire cette modification"
      redirect_to root_path
    end
  end

end
