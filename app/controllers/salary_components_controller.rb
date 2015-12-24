class SalaryComponentsController < ApplicationController
  before_action :set_salary_component, only: [:show, :edit, :update, :destroy]

  # GET /salary_components
  # GET /salary_components.json
  def index
    @salary_components = SalaryComponent.all
  end

  # GET /salary_components/1
  # GET /salary_components/1.json
  def show
  end

  # GET /salary_components/new
  def new
    @salary_component = SalaryComponent.new
    @deducted_salary_components = SalaryComponent.deducted
    @addected_salary_components = SalaryComponent.addected
  end

  # GET /salary_components/1/edit
  def edit
    # @deducted_salary_components = SalaryComponent.deducted
    # @addected_salary_components = SalaryComponent.addected
  end

  # POST /salary_components
  # POST /salary_components.json
  def create
    @salary_component = SalaryComponent.new(salary_component_params)

    respond_to do |format|
      if @salary_component.save
        # format.html { redirect_to @salary_component, notice: 'Salary component was successfully created.' }
        # format.json { render :show, status: :created, location: @salary_component }
        @salary_component = SalaryComponent.new
        @deducted_salary_components = SalaryComponent.deducted
        @addected_salary_components = SalaryComponent.addected
        format.js { @flag = true }
      else
        # format.html { render :new }
        # format.json { render json: @salary_component.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /salary_components/1
  # PATCH/PUT /salary_components/1.json
  def update
    respond_to do |format|
      if @salary_component.update(salary_component_params)
        # format.html { redirect_to @salary_component, notice: 'Salary component was successfully updated.' }
        # format.json { render :show, status: :ok, location: @salary_component }
        @salary_component = SalaryComponent.new
        @deducted_salary_components = SalaryComponent.deducted
        @addected_salary_components = SalaryComponent.addected
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @salary_component.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /salary_components/1
  # DELETE /salary_components/1.json
  def destroy
    @salary_component.destroy
    respond_to do |format|
      format.html { redirect_to salary_components_url, notice: 'Salary component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_component
      @salary_component = SalaryComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_component_params
      params.require(:salary_component).permit(:name, :is_deducted, :code, :parent_id, :description)
    end
end
