class UsersController < ApplicationController
  before_action :set_user

  def show
    @authored = @user.haikus
  end

  private

    def set_user
      @user = current_user
    end
end
