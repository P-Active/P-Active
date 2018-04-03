class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to session[:next] || root_path, flash: {notice: "Signed in successfully."}
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: {notice: "Signed out successfully."}
  end
end
