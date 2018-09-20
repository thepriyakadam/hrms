class EmployeeInsentivesController < ApplicationController
  before_action :set_employee_insentive, only: [:show, :edit, :update, :destroy]

  # GET /employee_insentives
  # GET /employee_insentives.json
  def index
    @employee_insentives = EmployeeInsentive.group("DATE_FORMAT(date,'%Y')","DATE_FORMAT(date,'%b')")

    #@employee_insentives = EmployeeInsentive.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PeriodicComponents"
  end

  # GET /employee_insentives/1
  # GET /employee_insentives/1.json

  def show
  end

  # GET /employee_insentives/new
  def new
    @employee_insentive = EmployeeInsentive.new
  end

  # GET /employee_insentives/1/edit
  def edit
  end

  def show_employee_insentive
    @employee_insentive = EmployeeInsentive.find(params[:format])
  end

  # POST /employee_insentives
  # POST /employee_insentives.json
  def create
    @employee_insentive = EmployeeInsentive.new(employee_insentive_params)

    respond_to do |format|
      if @employee_insentive.save
        format.html { redirect_to employee_insentives_url, notice: 'Employee insentive was successfully created.' }
        format.json { render :show, status: :created, location: @employee_insentive }
      else
        format.html { render :new }
        format.json { render json: @employee_insentive.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /employee_insentives/1
  # PATCH/PUT /employee_insentives/1.json
  def update
    respond_to do |format|
      if @employee_insentive.update(employee_insentive_params)
        format.html { redirect_to @employee_insentive, notice: 'Employee insentive was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_insentive }
      else
        format.html { render :edit }
        format.json { render json: @employee_insentive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_insentives/1
  # DELETE /employee_insentives/1.json
  def destroy
    @employee_insentive.destroy
    respond_to do |format|
      format.html { redirect_to employee_insentives_url, notice: 'Employee insentive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def employee_insentive_month
    @month = params[:month]
    @year = params[:year]
    date = Date.new(params[:year].to_i, Workingday.months[params[:month]])
    @employee_insentives = EmployeeInsentive.where("DATE_FORMAT(date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    respond_to do |f|
      f.js
      f.xls {render template: 'employee_insentives/employee_insentive.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'dynamic_report',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'employee_insentives/employee_insentive.pdf.erb',
        show_as_html: params[:debug].present?
      end
    end
  end

  def import_employee_insentive
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_employee_insentive_employee_insentives_path
    else
    EmployeeInsentive.import(params[:file])
    redirect_to employee_insentives_path, notice: "File imported."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_insentive
      @employee_insentive = EmployeeInsentive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_insentive_params
      params.require(:employee_insentive).permit(:employee_id, :date, :amount, :status, :description)
    end
end
