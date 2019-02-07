class SessionsController < ApplicationController

  def new
    @log_in
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find(params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path

    else
      flash.now[:danger] = 'Essaye encore'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
  end
end
