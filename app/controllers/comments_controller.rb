class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :new, :show]

  def index
  end 

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.find(params[:id])
  end 
  
  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create!('content' => params[:content],'gossip_id' => params[:gossip_id], 'user' => User.find(10))
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.permit(:content)
    if @comment.update(comment_params)
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to gossip_path(params[:gossip_id])
  end 
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi d'abord"
      redirect_to new_session_path
    end
  end

end

