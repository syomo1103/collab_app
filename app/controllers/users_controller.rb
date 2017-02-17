class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # flash[:notice] = "You successfully signed up!"
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def like
    current_user.like!(params[:observation_id]) unless current_user.like?(params[:observation_id])
    redirect_to :back
  end

  def unlike
    current_user.unlike!(params[:observation_id]) if current_user.like?(params[:observation_id])
    redirect_to :back
  end

  private
   def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :location, :sector, :email, :password, :password_confirmation, :image)
   end
end
