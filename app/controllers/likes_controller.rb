class LikesController < ApplicationController
  def create
    current_user.likes.build(haiku_id:params[:haiku_id]).save
    redirect_to comparison_path
  end

end
