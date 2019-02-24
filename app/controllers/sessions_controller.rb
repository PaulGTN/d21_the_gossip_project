class SessionsController < ApplicationController

  def new
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in(user)
      # redirige où tu veux, avec un flash ou pas
      current_user
      redirect_to root_path

    else
      flash.now[:danger] = 'Essaye encore'
      render 'new'
    end

  end
  
  def destroy
    #session.delete(:user_id)
    log_out if logged_in?
    redirect_to root_path
  end
end
