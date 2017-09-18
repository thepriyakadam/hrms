class AdvanceTypesController < ApplicationController
  before_action :set_advance_type, only: [:show, :edit, :update, :destroy]

  def new
    @advance_type = AdvanceType.new
    @advance_types = AdvanceType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="PayrollComponent"
  end

  # GET /advance_types/1/edit
  def edit
  end

  # POST /advance_types
  # POST /advance_types.json
  def create
    @advance_type = AdvanceType.new(advance_type_params)
    @advance_types = AdvanceType.all
    respond_to do |format|
      if @advance_type.save
        @advance_type = AdvanceType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Advance Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /advance_types/1
  # PATCH/PUT /advance_types/1.json
  def update
    @advance_type.update(advance_type_params)
    @advance_types = AdvanceType.all
    @advance_type = AdvanceType.new
  end

  # DELETE /advance_types/1
  # DELETE /advance_types/1.json
  def destroy
    @advance_type.destroy
    @advance_types = AdvanceType.all
  end

  def is_confirm
    @advance_type = AdvanceType.find(params[:advance_type])
    AdvanceType.find(@advance_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_advance_type_path
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_advance_type
    @advance_type = AdvanceType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advance_type_params
    params.require(:advance_type).permit(:interest,:rate,:is_confirm,:code, :name, :description)
  end
end
