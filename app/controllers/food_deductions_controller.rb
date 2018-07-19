class FoodDeductionsController < ApplicationController
  before_action :set_food_deduction, only: [:show, :edit, :update, :destroy]

  # GET /food_deductions
  # GET /food_deductions.json
  def index
    @food_deductions = FoodDeduction.group("strftime('%Y',food_date)")
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="PeriodicComponents"
  end

  # GET /food_deductions/1
  # GET /food_deductions/1.json
  def show
  end

  # GET /food_deductions/new
  def new
    @food_deduction = FoodDeduction.new
    @food_deductions = FoodDeduction.all
  end

  # GET /food_deductions/1/edit
  def edit
  end

  # POST /food_deductions
  # POST /food_deductions.json
  def create
    @food_deduction = FoodDeduction.new(food_deduction_params)
    @food_deduction.food_date = @food_deduction.food_date.end_of_month
   
      if @food_deduction.save
        @food_deduction = FoodDeduction.new
        @food_deductions = FoodDeduction.all
        @flag = true
      else
        @flag = false
      end

  end

  # PATCH/PUT /food_deductions/1
  # PATCH/PUT /food_deductions/1.json
  def update
      if @food_deduction.update(food_deduction_params)
        @food_deduction = FoodDeduction.new
        @food_deductions = FoodDeduction.all
        @flag = true
      else
        @flag = false
      end
  end

  # DELETE /food_deductions/1
  # DELETE /food_deductions/1.json
  def destroy
    @food_deduction.destroy
    
    @food_deductions = FoodDeduction.all
    redirect_to food_deductions_path
    
  end

  def calculate_food_deduction_amount
    total_coupan = params[:total_coupan].to_i
    food_coupan = FoodCoupanMaster.find(params[:id])
    price = food_coupan.price.to_f
    @amount = price * total_coupan
  end

  def modal
    @food_deduction = FoodDeduction.find(params[:format])
  end

  def employees
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?",date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      else current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)  
      end
    end
  end

  def display_food_deduction
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?",date.strftime('%m/%Y'))

      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      else current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)  
      end
    end
  end

  def food_deduction_xls
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin'
      @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      else current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)  
      end
    end
    respond_to do |format|
      format.xls {render template: 'food_deductions/food_deductions.xls.erb'}
    end
  end

  def food_deduction_pdf
    @year = params[:year]
    @month = params[:month]
    date = Date.new(@year.to_i, Workingday.months[@month])
    if current_user.class == Group
      @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y'))
    else
      if current_user.role.name == 'GroupAdmin'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?",date.strftime('%m/%Y'))
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
      elsif current_user.role.name == 'Employee'
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: current_user.employee_id)
      else current_user.role.name == 'AccountAdmin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        @food_deductions = FoodDeduction.where("DATE_FORMAT(food_date,'%m/%Y') = ?", date.strftime('%m/%Y')).where(employee_id: @employees)  
      end
    end
    respond_to do |format|
          format.json
          format.pdf do
            render pdf: 'food_deduction',
                  layout: 'pdf.html',
                  orientation: 'Landscape',
                  template: 'food_deductions/food_deduction.pdf.erb',
                  # show_as_html: params[:debug].present?,
                  :page_height      => 1000,
                  :dpi              => '300',
                  :margin           => {:top    => 10, # default 10 (mm)
                                :bottom => 10,
                                :left   => 20,
                                :right  => 20},
                  :show_as_html => params[:debug].present?
                end
             end
  end

  def food_deduction_report
    session[:active_tab] ="PayrollManagement"
   session[:active_tab1] ="SalaryProcess"
   session[:active_tab2] = "DeductionReport"
  end

  def dynamic_report
    # byebug
    from = params[:food_deduction][:from]
    to = params[:food_deduction][:to]
    @company = params[:food_deduction][:company_id]
    @location = params[:food_deduction][:company_location_id]
    @from = from.to_date
    @to = to.to_date
    
    if current_user.class == Group
      if @company == ""
        @food_deduction_id = FoodDeduction.where(food_date: @from..@to).take
        @food_deductions = FoodDeduction.where(food_date: @from..@to)
      elsif @location == "" || @location == nil
        @employees = Employee.where(status: 'Active',company_id: @company.to_i).pluck(:id)
        @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
        @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
      else
        @employees = Employee.where(status: 'Active',company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
        @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
        @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
      end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        if @company == ""
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to)
        elsif @location == "" || @location == nil
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Admin'
        if @company == ""
          @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        elsif @location == "" || @location == nil
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Branch'
        if @company == "" || @location == "" || @location == nil
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        if @company == "" || @location == "" || @location == nil
          @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        else
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Superviser'
        if @company == "" || @location == "" || @location == nil
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        else
          @emp = Employee.find(current_user.employee_id)
          @employees = @emp.subordinates
          @food_deduction_id = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees).take
          @food_deductions = FoodDeduction.where(food_date: @from..@to).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'Employee'
      end
    end
    respond_to do |f|
      f.js
      f.xls {render template: 'food_deductions/food_deductions_1.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'monthly_deduction',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'food_deductions/food_deduction.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end
  
  def import_food_deduction
  end

  def import_deduction
  file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_food_deduction_food_deductions_path
    else
    FoodDeduction.import_deduction_file(params[:file])
    redirect_to root_path, notice: "File imported."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_deduction
    @food_deduction = FoodDeduction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_deduction_params
    params.require(:food_deduction).permit(:food_date, :no_of_coupan, :amount, :employee_id, :return_coupan, :total_coupan, :food_coupan_master_id)
  end
end