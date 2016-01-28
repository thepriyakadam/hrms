class Salaryslip < ActiveRecord::Base
  belongs_to :employee
  belongs_to :template
  belongs_to :workingday
  belongs_to :salary_template

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |salaryslip|
      csv << salaryslip.attributes.values_at(*column_names)
    end
  end
end


end
