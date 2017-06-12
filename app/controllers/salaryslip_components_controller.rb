class SalaryslipComponentsController < ApplicationController
  skip_before_filter :authenticate!

  def index
    @month = params[:salaryslip_component][:month]
    @year = params[:salaryslip_component][:year]
    @company = params[:salaryslip_component][:company_id]
    @location = params[:food_deduction][:company_location_id]
    @salary_map_saps = SalaryMapSap.where(company_id: @company,company_location_id: @location)
    # @salary_components = SalaryComponent.all
    # @salaryslip_components = SalaryslipComponent.limit(50)
    if @company == ""
       @salaryslips = Salaryslip.where(month: @month,year: @year)
    elsif @location == ""
        @employees = Employee.where(company_id: @company.to_i)
        # @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: 68)
       @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: @employees)
    else
       @employees = Employee.where(company_id: @company.to_i,company_location_id: @location)
       # @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: 68)
       @salaryslips = Salaryslip.where(month: @month,year: @year,employee_id: @employees)
    end
    # @salaryslips_1 = Salaryslip.where(month: @month,year: @year)limit(1).present?
    if @salaryslips.count > 0
      respond_to do |format|
      format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
      end
    else
    # byebug
    flash[:alert] = "Salaryslip not yet processed or present"
    redirect_to new_salaryslip_component_path
    end
  end


  # def index
  #   # byebug
  #   @month = params[:salaryslip_component][:month]
  #   @year = params[:salaryslip_component][:year]
  #   @salary_components = Sala if @salaryslips_1 == "true"
  #     respond_to do |format|
  #     format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
  #   end
  #   else
  #   flash[:danger] = "Salaryslip not yet processed"
  #   end
  #   # @maps ryComponent.all
  #   # @salaryslip_components = SalaryslipComponent.limit(50)
  #   @salaryslips = Salaryslip.where(month: @month,year: @year).limit(1)
  #    @salaryslips_1 = Salaryslip.where(month: @month,year: @year)limit(1).present?
  #   if @salaryslips_1 == "true"
  #     respond_to do |format|
  #     format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
  #   end
  #   else
  #   flash[:danger] = "Salaryslip not yet processed"
  #   end
  #   # @maps = SalaryMapSap.all
    
  # end

#   def xml_print
#     # byebug
#     @month = params[:month]
#     @year = params[:year]
#     @maps = SalaryMapSap.all
#     # @salaryslip_components = SalaryslipComponent.limit(50)
                                                                                                          
#     respond_to do |format|
#     format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
#     # @salary_components = SalaryComponent.all
#     @maps = SalaryMapSap.all
#   end
# end
    
  

  def edit
    @salaryslip_component = SalaryslipComponent.find(params[:id])
  end

  def update
    @salaryslip_component = SalaryslipComponent.find(params[:id])
    @salaryslip_component.update(salaryslip_component_params)

    @instalment_array = []
    @salaryslip = Salaryslip.find(@salaryslip_component.salaryslip_id)
    @addable_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', false, @salaryslip.id)
    @deducted_salary_components = SalaryslipComponent.where('is_deducted = ? and salaryslip_id = ?', true, @salaryslip.id)
    @working_day = Workingday.find(@salaryslip.workingday_id)
    @employee = Employee.find(@salaryslip.employee_id)
    @advance_salary = AdvanceSalary.find_by_employee_id(@employee.id)
    unless @advance_salary.nil?
      @instalments = @advance_salary.instalments
      @instalments.try(:each) do |i|
        unless i.instalment_date.nil?
          if i.try(:instalment_date).strftime('%B') == params['month'] && i.try(:instalment_date).strftime('%Y') == params['year']
            @instalment_array << i
          end
        end
      end
    end
  end
  
  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def salaryslip_component_params
    params.require(:salaryslip_component).permit(:salaryslip_id, :salary_component_id, :actual_amount, :calculated_amount, :is_deducted, :other_component_name)
  end
end