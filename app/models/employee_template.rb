class EmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salary_template
  has_many :employee_salary_templates
  # validates :employee_id, uniqueness: { scope: [:is_active] }
  # validates :employee_id, uniqueness: { scope: [:is_active] }

  validates :employee_id, uniqueness: { scope: [:salary_template_id] }
  def self.create_object(employee_id, template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = true
      et.start_date = Date.today
    end
    employee_template
  end

  def self.build_objects(arrays, params, employee_id, template_id, employee_template)
    arrays.each do |a|
      salary_component = SalaryComponent.find(params[:salary_component_id][a])
      next if salary_component.name == 'CTC'
      employee_template.employee_salary_templates.build(employee_id: employee_id, \
                                                        salary_template_id: template_id, \
                                                        salary_component_id: params[:salary_component_id][a], \
                                                        is_deducted: params[:is_deducted][a], \
                                                        parent_salary_component_id: params[:parent_salary_component_id][a], \
                                                        percentage: params[:percentage][a], \
                                                        to_be_paid: params[:to_be_paid][a], \
                                                        monthly_amount: params[:monthly_amount][a], \
                                                        annual_amount: params[:annual_amount][a])
    end
    employee_template
  end

  def self.filter_records(current_user)
    @employee_templates =  if current_user.class == Group
      EmployeeTemplate.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        EmployeeTemplate.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        EmployeeTemplate.where(employee_id: current_user.employee_id)
      end
    end
  end

  def self.create_new_object(employee_id, template_id)
    employee_template = EmployeeTemplate.new do |et|
      et.employee_id = employee_id
      et.salary_template_id = template_id
      et.is_active = false
      # et.start_date = Date.today
    end
    employee_template
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

      first = spreadsheet.cell(i,1)

      @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)

      if @employee == nil
      else
        @employee_id = @employee.id
        salary_template = spreadsheet.cell(i,'C')
        type = spreadsheet.cell(i,'D')
        @cella = spreadsheet.cell(i,'E')

        @template = SalaryTemplate.find_by(code: salary_template)

        if @template.nil?
        else
           @template_id = @template.id
          # annual_amount = spreadsheet.cell(i,'D')
          # hra = spreadsheet.cell(i,'E')
          # conveyance = spreadsheet.cell(i,'F')

          if EmployeeTemplate.exists?(employee_id: @employee.id,is_active: true)
            @pre_employee_template = EmployeeTemplate.where(employee_id: @employee.id,is_active: true).take
            @pre_employee_template.update(is_active: false, end_date: Date.today)
            #@employee_template.update(is_active: true, start_date: params[:activate][:activate_date])
          else
          end#EmployeeTemplate.exists?

            employee_template = EmployeeTemplate.new do |et|
              et.employee_id = @employee_id
              et.salary_template_id = @template_id
              et.is_active = true
              et.start_date = Date.today
            end
            #employee_template.save

            salary_component_template = SalaryComponentTemplate.where(salary_template_id: @template_id)
            salary_component_template.each do |s|
              #@employee_template = EmployeeTemplate.where(employee_id: @employee_id,salary_template_id: s.salary_template_id).take

              if EmployeeSalaryTemplate.exists?(employee_id: @employee_id,salary_template_id: @template_id,
                salary_component_id: s.salary_component_id)
              else
                salary_component = SalaryComponent.find_by(id: s.salary_component_id)
                component_name = salary_component.name
                #(2..spreadsheet.last_row).each do |cl|
                    #@value = spreadsheet.cell(i,cl)

                    @first_row = spreadsheet.row(1)
                    total_value  = @first_row.count

                    for a in 1..total_value.to_i

                      #byebug
                      col_name = @first_row[a]
                      if component_name == col_name
                       @b = a.to_i + 1
                      @value = spreadsheet.cell(i,@b)

                        employee_template.save
                        @emp_template = EmployeeTemplate.last

                        if type == "Monthly" || type == "monthly"
                          annual_value = @value.to_f*12
                          @employee_salary_template = EmployeeSalaryTemplate.create(employee_id: @employee_id,
                          salary_template_id: @template_id,salary_component_id: s.salary_component_id,
                          is_deducted: false,annual_amount: annual_value.to_f,monthly_amount: @value.to_f,
                          employee_template_id: @emp_template.id )
                        elsif type == "Yearly" || type == "yearly"
                          monthly_value = @value.to_f/12
                          @employee_salary_template = EmployeeSalaryTemplate.create(employee_id: @employee_id,
                          salary_template_id: @template_id,salary_component_id: s.salary_component_id,
                          is_deducted: false,annual_amount: @value.to_f,monthly_amount: monthly_value.to_f,
                          employee_template_id: @emp_template.id )
                        else
                        end

                      else
                      end
                    end#for a in 1

                    # @v = cl
                    # @name = spreadsheet.cell(cl,@v)
                    # @value = spreadsheet.cell(i,@v)
                    #   if component_name == @name
                    #     #byebug
                    #      employee_template.save
                    #      @employee_salary_template = EmployeeSalaryTemplate.create(employee_id: @employee_id,
                    #         salary_template_id: @template_id,salary_component_id: s.salary_component_id,
                    #         is_deducted: false,annual_amount: @value.to_f )
                    #   else
                    #   end



                    # @first_row = spreadsheet.row(1)
                    # total_value  = @first_row.count
                    # for i in 0..total_value.to_i
                    #   col_name = @first_row[i]
                    #   if col_name == component_name
                    #     (2..spreadsheet.last_row).each do |cl|
                    #       @value = spreadsheet.cell(i,cl)
                    #   else
                    #   end
                    # end

                #end#do(1..spreadsheet.last_column).
              end
            end#do|s|

        end#template.nil?
      end#@employee == nil
    end#do
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end