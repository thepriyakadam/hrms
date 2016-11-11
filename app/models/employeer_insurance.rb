class EmployeerInsurance < ActiveRecord::Base
  belongs_to :employee

  def self.create_insurance(calculated_amount,actual_amount, employee_id, date)
    insurance_master = InsuranceMaster.find_by_is_active(true)
    unless insurance_master.nil?
      amount = calculated_amount
      actual_amount = actual_amount
      EmployeerInsurance.new do |e|
        e.employee_id = employee_id
        e.amount = amount
        e.actual_amout = actual_amount
        e.insurance_date = date
        e.save
      end
    end
  end

end
