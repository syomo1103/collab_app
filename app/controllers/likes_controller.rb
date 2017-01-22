class LikesController < ApplicationController

  def like
    @user = current_user
    @observation = Observation.find(params[:observation_id])
    @user.like!(@observation)
  end

  def unlike
    @user = current_user
    @like = @user.likes.find_by_observation_id(params[:observation_id])
    @observation = Observation.find(params[:observation_id])
    @like.destroy!
  end

end
