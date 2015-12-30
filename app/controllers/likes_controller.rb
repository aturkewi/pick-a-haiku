class LikesController < ApplicationController
  def create
    user = current_user || User.find(2)
    user.likes.build(haiku_id:params[:haiku_id]).save
    redirect_to comparison_path
  end

end
