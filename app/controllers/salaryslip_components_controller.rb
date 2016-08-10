class SalaryslipComponentsController < ApplicationController
  skip_before_filter :authenticate!

  def index
    # byebug
    @month = params[:month]
    @year = params[:year]
    @salaryslip_components = SalaryslipComponent.limit(50)
    # @salary_components = SalaryComponent.all
    @maps = SalaryMapSap.all
    respond_to do |format|
      format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
  end

  def xml_print
    # byebug
    @month = params[:month]
    @year = params[:year]
    @maps = SalaryMapSap.all
    # @salaryslip_components = SalaryslipComponent.limit(50)
                                                                                                          
    respond_to do |format|
    format.xml { send_data render_to_string(:index), :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
    # @salary_components = SalaryComponent.all
    @maps = SalaryMapSap.all
  end
end
    
  end

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