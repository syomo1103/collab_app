class PatientsController < ApplicationController

  def index
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    # @patient.observation = @observation
    # @patient.user = current_user
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update_attributes(params.require(:patient).permit(:first_name, :last_name, :age, :gender, :home_session, :school_session))
    redirect_to @patient
  end

  def destroy
    @patient = Patient.find(params[:id])
    current_user.observations.where(patient_id: @patient).destroy_all
    @patient.destroy if @patient.observations.count == 0
    redirect_to patients_path
    # p params
    # @observation = @patient.observations
    # if @patient.observations.count == 1 && (@observation.user_id == current_user.id)
    #   p '*' * 50
    #   p @patient
    #   # @patient.destroy
    #   Patient.destroy(@patient)
    #   redirect_to patients_path
    # else
    # end
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :gender, :home_session, :school_session)
  end

end
