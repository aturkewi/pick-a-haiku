class UsersController < ApplicationController
  before_action :set_user

  def show
    @auhtored = @user.haikus
  end

  private

    def set_user
      @user = current_user
    end
end
