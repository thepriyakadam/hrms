class OvertimeSalary < ActiveRecord::Base
  belongs_to :employee
  before_create :calculate_amount

  def calculate_amount
    @overtime_master = OvertimeMaster.find_by_status(true)
    @esic_master = EsicMaster.first
    basic_amount = self.basic_amount
    day = @overtime_master.day
    company_hrs = @overtime_master.company_hrs
    ot_rate = @overtime_master.ot_rate
    ot_hrs = self.ot_hrs
    percentage = @esic_master.percentage
    attendence_bouns_amount = self.attendence_bouns_amount
    paid_holiday_amount = self.paid_holiday_amount

    basic_amount_by_day = basic_amount/day
    basic_amount_by_day_by_company_hrs = basic_amount_by_day/company_hrs
    temp = basic_amount_by_day_by_company_hrs*ot_rate
    ot_amount = temp * self.ot_hrs
    ot_esic_amount = (ot_amount/100*percentage)
    if master_esic.esic and addable_total_calculated_amount <= master_esic.max_limit and @employee.joining_detail.have_esic
      total_amount = ot_amount - ot_esic_amount
    else
      total_amount = ot_amount
    end

    net_payble = total_amount + attendence_bouns_amount + paid_holiday_amount
    self.ot_amount = ot_amount
    self.ot_esic_amount = ot_esic_amount
    self.total_amount = total_amount
    self.net_payble_amount = net_payble
  end
end
