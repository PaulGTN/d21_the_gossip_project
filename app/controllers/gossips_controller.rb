class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title],'content' => params[:content], 'user' => User.find(11))
    if @gossip.save
      redirect_to root_path, alert: "Ton gossip a bien été enregistré"
    else
      render 'new'
    end 
  end 
end
