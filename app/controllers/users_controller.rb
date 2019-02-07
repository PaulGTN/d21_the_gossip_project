class UsersController < ApplicationController

  def new
   @user = User.new
  end

  def create
    @user = User.new('first_name' => params[:first_name], 'last_name' => params[:last_name], 'description' => params[:description], 'email' => params[:email], 'age' => params[:age], 'password' => params[:password])
    if @user.save
      flash[:success] = "Ton inscription est réussie"
      redirect_to root_path 
    else
      flash[:alert] = "C'est pas bon!"
      render 'new'
    end
  end


  def show
      @user = User.find(params[:id])  
  end
end
