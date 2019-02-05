class StaticPagesController < ApplicationController
  #On définit la méthode team, vide car sans variable
  def team
  end

  #Idem
  def contact
  end

  #Comme expliqué dans les routes, welcome ne sert à rien, si tu veux un accueil personnalisé tape simplement "/ton prénom" à la suite de "localhost:3000"
  def welcome
    @first_name = params['first_name']
  end

  #On définit la méthode accueil et les variables dont elle à besoin
  def accueil
    @first_name = params['first_name']
    @gossips = Gossip.all
  end

  #Idem
  def gossip
    @gossip = Gossip.find_by(id: params[:gossip_id])
    @author = User.find_by(id: @gossip.user_id)
    @first_name = @author.first_name  
    @user = @gossip.user
  end

  #Idem
  def profil
    @user = User.find_by(id: params[:user_id])  
  end 
  
end
