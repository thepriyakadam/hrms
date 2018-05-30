class MembershipTypesController < ApplicationController
  before_action :set_membership_type, only: [:show, :edit, :update, :destroy]

  # GET /membership_types
  # GET /membership_types.json
  def index
    @membership_type = MembershipType.new
    @membership_types = MembershipType.all
  end

  # GET /membership_types/1
  # GET /membership_types/1.json
  def show
  end

  # GET /membership_types/new
  def new
    @membership_type = MembershipType.new
    @membership_types = MembershipType.all
  end

  # GET /membership_types/1/edit
  def edit
  end

  # POST /membership_types
  # POST /membership_types.json
  def create
     @membership_type = MembershipType.new(membership_type_params)
     @membership_types = MembershipType.all
     respond_to do |format|
      if @membership_type.save
         @membership_type = MembershipType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Membership Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /membership_types/1
  # PATCH/PUT /membership_types/1.json
  def update
    @membership_type.update(membership_type_params)
    @membership_type = MembershipType.new
    @membership_types = MembershipType.all
      
  end

  # DELETE /membership_types/1
  # DELETE /membership_types/1.json
  def destroy
    @membership_type.destroy
    @membership_types = MembershipType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_type
      @membership_type = MembershipType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_type_params
      params.require(:membership_type).permit(:code, :name, :status)
    end
end
