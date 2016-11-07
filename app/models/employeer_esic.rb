class EmployeerEsic < ActiveRecord::Base
  belongs_to :employee

  def self.create_esic(calculated_amount, employee_id, date)
    esic_employer_master = EsicEmployerMaster.find_by_is_active(true)
    unless esic_employer_master.nil?
      amount = calculated_amount
      EmployeerEsic.new do |e|
        e.employee_id = employee_id
        e.amount = amount
        e.esic_date = date
        e.save
      end
    end
  end


end
