class PatientsController < ApplicationController

  def index
  end

  def new
    @patient = Patient.new
  end

  def create
    current_user.patients.create(params.require(:patient).permit(:first_name, :last_name, :age, :gender, :home_session, :school_session))
    redirect_to patients_path
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

  # def destroy
  #   @patient = Patient.find(params[:id])
  #   current_user.observations.where(patient: @patient).destroy_all
  #   redirect_to patients_path
  # end

end
