class OtherSalaryComponentsController < ApplicationController
  before_action :set_other_salary_component, only: [:show, :edit, :update, :destroy]

  # GET /other_salary_components
  # GET /other_salary_components.json
  def index
    @other_salary_components = OtherSalaryComponent.all
  end

  # GET /other_salary_components/1
  # GET /other_salary_components/1.json
  def show
  end

  # GET /other_salary_components/new
  def new
    @other_salary_component = OtherSalaryComponent.new
  end

  # GET /other_salary_components/1/edit
  def edit
  end

  # POST /other_salary_components
  # POST /other_salary_components.json
  def create
    @other_salary_component = OtherSalaryComponent.new(other_salary_component_params)

    respond_to do |format|
      if @other_salary_component.save
        format.html { redirect_to @other_salary_component, notice: 'Other salary component was successfully created.' }
        format.json { render :show, status: :created, location: @other_salary_component }
      else
        format.html { render :new }
        format.json { render json: @other_salary_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_salary_components/1
  # PATCH/PUT /other_salary_components/1.json
  def update
    respond_to do |format|
      if @other_salary_component.update(other_salary_component_params)
        format.html { redirect_to @other_salary_component, notice: 'Other salary component was successfully updated.' }
        format.json { render :show, status: :ok, location: @other_salary_component }
      else
        format.html { render :edit }
        format.json { render json: @other_salary_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_salary_components/1
  # DELETE /other_salary_components/1.json
  def destroy
    @other_salary_component.destroy
    respond_to do |format|
      format.html { redirect_to other_salary_components_url, notice: 'Other salary component was successfully destroyed.' }
      format.json { head :no_content }
    end
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
