class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    # @observation = Observation.find(params[:observation_id])
    @comment = Comment.new
  end

  def create
    @observation = Observation.find(params[:observation_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.observation = @observation
    if @comment.save
      redirect_to @observation
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    # @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    # @observation = Observation.find(params[:observation_id])
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @observation
  end

  def destroy
    @comment = Comment.find(params[:id])
    @observation = @comment.observation
    @comment.destroy
    redirect_to @observation
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :observation_id)
  end

end
