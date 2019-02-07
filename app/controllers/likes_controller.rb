class LikesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @user = current_user
    @like = Like.new(user: @user, gossip_id: params[:gossip_id])
    if @like.save
      redirect_to gossip_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find_by(user: current_user, gossip_id: params[:gossip_id])
    @like.destroy
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi d'abord"
      redirect_to new_session_path
    end
  end
end
