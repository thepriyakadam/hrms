class SalaryComponent < ActiveRecord::Base
  scope :deducted, -> { where(is_deducted: true) }
  scope :addected, -> { where(is_deducted: false) }
  validates :name, :code, presence: true, uniqueness: { case_sensitive: false }
  #validates :is_deducted, presence: true
  has_many :employee_salary_templates
  has_many :salaryslip_components
  has_many :salary_component_templates
  has_many :employee_arrear_items
  has_many :salary_comp_mappings
  has_many :parent_salary_component_templates, class_name: 'SalaryComponentTemplate',
                                               foreign_key: 'parent_salary_component_id'
  has_many :children, class_name: 'SalaryComponent',
                      foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'SalaryComponent'

  def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        @code = spreadsheet.cell(i,'B')
        code = @code.to_i
        component_name = spreadsheet.cell(i,'C')
        description = spreadsheet.cell(i,'D')
        account_code = spreadsheet.cell(i,'E')
        base_Component = spreadsheet.cell(i,'F')
        deducted = spreadsheet.cell(i,'G')
        status = spreadsheet.cell(i,'H')

        if status == "Active" || status == "active"
           status = true
        else
          status = false
        end
        if deducted == "Yes" || deducted == "yes"
           deducted = true
        else
          deducted = false
        end
        if base_Component == "Yes" || base_Component == "yes"
           base_Component = true
        else
          base_Component = false
        end
        
        @salary_component = SalaryComponent.find_by(code: code.to_s)
        if @salary_component.nil?
          @salary_component = SalaryComponent.create(code: code.to_s,name: component_name,description: description,account_code: account_code,is_deducted: deducted,is_base: base_Component,is_active: status)     
        else
          @salary_component.update(code: code.to_s,name: component_name,description: description,account_code: account_code,is_deducted: deducted,is_base: base_Component,is_active: status)
        end
    end
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
