class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to patients_path
    else
      redirect_to root_path, alert: 'Invalid login credentials - try again.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "You've successfully logged out."
  end

end
