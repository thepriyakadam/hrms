module TravelRequestsHelper
 
 def all_travel_option
    TravelOption.all.collect { |x| [x.name, x.id] }
  end

  def all_travel_mode
    TravelMode.all.collect { |x| [x.name, x.id] }
  end
  
  def month_total_amount(overtime_date, employee_id)
    OvertimeDailyRecord.where(employee_id: employee_id, ot_daily_date: overtime_date.at_beginning_of_month..overtime_date.at_end_of_month).sum(:ot_daily_amount)
  end

   def all_reporting_master_list1
    ReportingMaster.where.not(employee_id: current_user.employee_id).collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
   end

end
