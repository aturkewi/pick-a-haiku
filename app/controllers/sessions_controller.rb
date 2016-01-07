class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_info]={small_image:env["omniauth.auth"][:info][:image]}
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:user_info] = nil
    redirect_to root_path
  end
end
