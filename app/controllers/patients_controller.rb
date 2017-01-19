class PatientsController < ApplicationController

  def index
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:warning] = 'Patient has been created. NOTE: This patient has not been added to your caseload. Please create an observation.'
      redirect_to @patient
    else
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @my_obs = current_user.observations.where(patient_id: @patient.id)
    @other_obs = @patient.observations.where.not(user_id: current_user.id)
    @users = @patient.users.all
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update_attributes(patient_params)
    redirect_to @patient
  end

  def destroy
    @patient = Patient.find(params[:id])
    current_user.observations.where(patient_id: @patient).destroy_all
    @patient.destroy if @patient.observations.count == 0
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :gender, :diagnosis, :parent, :parent_email, :home_session, :school_session, :image)
  end

end
