class ExpensesMaster < ActiveRecord::Base
  belongs_to :expence_opestion
  belongs_to :mode
  belongs_to :billing_option
  belongs_to :employee_grade

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        employee_grade = spreadsheet.cell(i,'B')
        @employee_grade = EmployeeGrade.find_by(name: employee_grade)
        expence_opestion = spreadsheet.cell(i,'C')
        @expence_opestion = ExpenceOpestion.where(name: expence_opestion,employee_grade_id: @employee_grade.id).take
        mode = spreadsheet.cell(i,'D')
        @mode = Mode.find_by(name: mode,expence_opestion_id: @expence_opestion.id)
        option = spreadsheet.cell(i,'E')
        @option = BillingOption.find_by(name: option)
        billing_option = spreadsheet.cell(i,'F')
        min_amount = spreadsheet.cell(i,'G')
        max_amount = spreadsheet.cell(i,'H')
        status = spreadsheet.cell(i,'I')


        if @employee_grade.nil? || @expence_opestion.nil? || @mode.nil? || @option.nil? || billing_option.nil? || 
        	min_amount.nil? || max_amount.nil?
        else
          employee_grade_id = @employee_grade.id
          expence_opestion_id = @expence_opestion.id
          mode_id = @mode.id
          billing_option_id = @option.id
         	@expence_master = ExpensesMaster.Where(employee_grade_id: employee_grade_id, expence_opestion_id: expence_opestion_id,mode_id: mode_id,
             billing_option_id: billing_option_id, billing_opestion: billing_option).take
          if @expence_master == nil
          	@expence_opestions_new = ExpensesMaster.create(employee_grade_id: employee_grade_id, expence_opestion_id: expence_opestion_id,mode_id: mode_id,
          	 billing_option_id: billing_option_id, billing_opestion: billing_option,min_amount: min_amount,max_amount: max_amount,status: status)
          else 
          	@expence_master.update(employee_grade_id: employee_grade_id, expence_opestion_id: expence_opestion_id,mode_id: mode_id,
             billing_option_id: billing_option_id, billing_opestion: billing_option,min_amount: min_amount,max_amount: max_amount,status: status)
        	end
        end#@expence_opestion.nil?
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
