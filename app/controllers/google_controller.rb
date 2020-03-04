class GoogleController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    p request.env["omniauth.auth"]
    if user.save
        session[:user_id] = user.id
        redirect_to root_path
    else
      redirect_to new_google_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_google_path
  end

end
