class EmployeerPf < ActiveRecord::Base
  belongs_to :employee

  def self.create_fp(calculated_amount,actual_amount, employee_id, date)
    pf_master = PfMaster.find_by_is_active(true)
    unless pf_master.nil?
      amount = calculated_amount
      actual_amount = actual_amount
      EmployeerPf.new do |e|
        e.employee_id = employee_id
        e.amount = amount
        e.actual_amount = actual_amount
        e.pf_date = date
        e.save
      end
    end
  end

end
