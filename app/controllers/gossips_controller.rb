class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id]) 
    @user = @gossip.user
    @comments = @gossip.comments
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title],'content' => params[:content], 'user' => User.find(11))
    if @gossip.save
      redirect_to root_path flash[:success] = "Ton Gossip a bien été enregistré"
    else
      render 'new'
    end 
  end 

  def edit
    @gossip = Gossip.find(params[:id])
  end 

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @gossip_params = params.permit(:title, :content)
    if @gossip.update(gossip_params)  
      redirect to @gossip
    else
      render :edit
    end 
  end 

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path flash[:success] = "Plus personne ne verra cette horreur !"
  end 

end
