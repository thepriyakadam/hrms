class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def new
    @role = Role.new
    @roles = Role.all
  end

 
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @role.save
    @roles = Role.all
    @role = Role.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name)
    end
end
