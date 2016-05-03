module OvertimeSalariesHelper
  def month_total_amount(overtime_date, employee_id)
    OvertimeDailyRecord.where(employee_id: employee_id, ot_daily_date: overtime_date.at_beginning_of_month..overtime_date.at_end_of_month).sum(:ot_daily_amount)
  end
end
