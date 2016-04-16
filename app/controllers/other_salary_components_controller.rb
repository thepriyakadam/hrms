class OtherSalaryComponentsController < ApplicationController
  before_action :set_other_salary_component, only: [:show, :edit, :update, :destroy]

  def new
    @other_salary_component = OtherSalaryComponent.new
    @other_salary_components = OtherSalaryComponent.all
  end

  # GET /other_salary_components/1/edit
  def edit
  end

  # POST /other_salary_components
  # POST /other_salary_components.json
  def create
    @other_salary_component = OtherSalaryComponent.new(other_salary_component_params)
    @other_salary_components = OtherSalaryComponent.all
    respond_to do |format|
      if @other_salary_component.save
        @other_salary_component = OtherSalaryComponent.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'salary Component Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /other_salary_components/1
  # PATCH/PUT /other_salary_components/1.json
  def update
    @other_salary_component.update(other_salary_component_params)
    @other_salary_components = OtherSalaryComponent.all
    @other_salary_component = OtherSalaryComponent.new
  end

  # DELETE /other_salary_components/1
  # DELETE /other_salary_components/1.json
  def destroy
    @other_salary_component.destroy
    @other_salary_components = OtherSalaryComponent.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_other_salary_component
    @other_salary_component = OtherSalaryComponent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def other_salary_component_params
    params.require(:other_salary_component).permit(:code, :name, :description, :is_deducted)
  end
end
