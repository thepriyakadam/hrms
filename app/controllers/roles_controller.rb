class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def new
    @role = Role.new
    @roles = Role.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @roles = Role.all
    respond_to do |format|
      if @role.save
        @role = Role.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Role is Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @role.update(role_params)
    @roles = Role.all
    @role = Role.new
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    @roles = Role.all
  end

  def dynamic_form
    @roles = Role.all
  end

  def role_edit_list
    @employees = Member.all
    session[:active_tab] ="UserAdministration"
  end

  def edit_role
    @member = Member.find(params[:id])
    @roles = Role.all
  end

  def update_role
    @member = Member.find(params[:id])
    @member.role_id = params[:member][:role_id]
    if @member.save
      @flag = true
      @employees = Member.all
    else
      @flag = false
    end
  end

  def is_confirm
    @role = Role.find(params[:role])
    Role.find(@role.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_role_path
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:is_confirm,:name)
  end
end
