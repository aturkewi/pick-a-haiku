class UsersController < ApplicationController
  before_action :set_user

  def show
    @authored = @user.haikus
    @liked = Haiku.get_liked_by_user(@user.id)
    @favorited = Haiku.get_favorited_by_user(@user.id)
  end

  private

    def set_user
      @user = current_user
    end
end
