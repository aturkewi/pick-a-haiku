class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(haiku_id: params[:haiku_id])
    favorite.save
  end

  def destroy
  end

end
