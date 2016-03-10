class OvertimeDailyRecord < ActiveRecord::Base
  belongs_to :employee
  # before_create :calculate_amount

  # def calculate_amount
  #   @overtime_master = OvertimeMaster.find_by_status(true)
  #   @esic_master = EsicMaster.first
  #   basic_amount = self.basic_amount
  #   day = @overtime_master.day
  #   company_hrs = @overtime_master.company_hrs
  #   ot_rate = @overtime_master.ot_rate
  #   ot_hrs = self.ot_hrs
  #   percentage = @esic_master.percentage
    
  #   basic_amount_by_day = basic_amount/day
  #   basic_amount_by_day_by_company_hrs = basic_amount_by_day/company_hrs
  #   wages = basic_amount_by_day_by_company_hrs*ot_rate
  #   ot_amount = wages * self.ot_hrs
    
  #   self.ot_rate = wages.round
  #   self.ot_daily_amount = ot_amount.round
  # end
end
