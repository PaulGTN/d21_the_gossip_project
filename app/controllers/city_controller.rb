class CityController < ApplicationController
end

def show
  @User = User.find_by(id: @gossip.user_id)
  @city = @user.city_id
end 