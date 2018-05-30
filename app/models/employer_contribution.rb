class EmployerContribution < ActiveRecord::Base
  belongs_to :employee

  def self.create_contribution(employee_id)
      EmployerContribution.new do |ec|
        ec.employee_id = employee_id
        ec.save
    end
  end

end
