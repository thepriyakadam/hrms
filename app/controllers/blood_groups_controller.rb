class BloodGroupsController < ApplicationController
  before_action :set_blood_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @blood_group = BloodGroup.new
    @blood_groups = BloodGroup.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  def edit
  end

  def create
    @blood_group = BloodGroup.new(blood_group_params)
    @blood_groups = BloodGroup.all
    respond_to do |format|
      if @blood_group.save
        @blood_group = BloodGroup.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Blood Group Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  def update
    @blood_group.update(blood_group_params)
    @blood_groups = BloodGroup.all
    @blood_group = BloodGroup.new
  end

  def destroy
    @blood_group.destroy
    @blood_groups = BloodGroup.all
  end

  def is_confirm
    @blood_group = BloodGroup.find(params[:blood_group])
    BloodGroup.find(@blood_group.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_blood_group_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blood_group
    @blood_group = BloodGroup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blood_group_params
    params.require(:blood_group).permit(:name, :is_confirm)
  end
end
