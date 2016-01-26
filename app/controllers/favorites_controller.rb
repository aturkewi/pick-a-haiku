class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(haiku_id: params[:haiku_id])
    favorite.save
  end

  def destroy
    haiku_id = params[:haiku_id]
    user_id = current_user.id
    favorite = Favorite.find_by(haiku_id:haiku_id, user_id:user_id)
    favorite.delete
    render json:{message:'favorite successfully deleted'}
  end

end
