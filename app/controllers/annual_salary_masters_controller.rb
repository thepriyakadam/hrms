class AnnualSalaryMastersController < ApplicationController
  before_action :set_annual_salary_master, only: [:show, :edit, :update, :destroy]

  # GET /annual_salary_masters
  # GET /annual_salary_masters.json
  def index
    @annual_salary_masters = AnnualSalaryMaster.all
  end

  # GET /annual_salary_masters/1
  # GET /annual_salary_masters/1.json
  def show
  end

  # GET /annual_salary_masters/new
  def new
    @annual_salary_master = AnnualSalaryMaster.new
  end

  # GET /annual_salary_masters/1/edit
  def edit
  end

  # POST /annual_salary_masters
  # POST /annual_salary_masters.json
  def create
    @annual_salary_master = AnnualSalaryMaster.new(annual_salary_master_params)

    respond_to do |format|
      if @annual_salary_master.save
        format.html { redirect_to @annual_salary_master, notice: 'Annual salary master was successfully created.' }
        format.json { render :show, status: :created, location: @annual_salary_master }
      else
        format.html { render :new }
        format.json { render json: @annual_salary_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annual_salary_masters/1
  # PATCH/PUT /annual_salary_masters/1.json
  def update
    respond_to do |format|
      if @annual_salary_master.update(annual_salary_master_params)
        format.html { redirect_to @annual_salary_master, notice: 'Annual salary master was successfully updated.' }
        format.json { render :show, status: :ok, location: @annual_salary_master }
      else
        format.html { render :edit }
        format.json { render json: @annual_salary_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_salary_masters/1
  # DELETE /annual_salary_masters/1.json
  def destroy
    @annual_salary_master.destroy
    respond_to do |format|
      format.html { redirect_to annual_salary_masters_url, notice: 'Annual salary master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annual_salary_master
      @annual_salary_master = AnnualSalaryMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annual_salary_master_params
      params.require(:annual_salary_master).permit(:employee_id, :name, :code, :description, :amount)
    end
end
