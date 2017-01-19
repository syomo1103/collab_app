class ObservationsController < ApplicationController

  def index
    @observations = Observation.all
  end

  def new
    @observation = Observation.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @observation = Observation.new(ob_params)
    @observation.patient = @patient
    @observation.user = current_user
    if @observation.save
      redirect_to @patient
    else
      render :new
    end
  end

  def new_new
    @observation = Observation.new
  end

  def create_new
    @observation = Observation.new(params.require(:observation).permit(:patient_id, :user_id, :date, :goal, :program, :prompt, :behavior, :session_notes))
    @patient = @observation.patient
    @observation.user = current_user
    if @observation.save
      redirect_to patients_path
    else
      render :new_new
    end
  end

  def show
    @observation = Observation.find(params[:id])
    @comment = Comment.new
    @my_comments = @observation.comments.where(user_id: current_user.id)
  end

  def edit
    @observation = Observation.find(params[:id])
  end

  def update
    @observation = Observation.find(params[:id])
    @observation.update_attributes(ob_params)
    redirect_to @observation
  end

  def destroy
    @observation = Observation.find(params[:id])
    @patient = @observation.patient
    @observation.destroy
    redirect_to @patient
  end

  private
  def ob_params
    params.require(:observation).permit(:date, :goal, :program, :prompt, :behavior, :session_notes)
  end

end
