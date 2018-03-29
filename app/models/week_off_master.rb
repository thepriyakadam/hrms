class WeekOffMaster < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true

  # def is_presnt(i)
  #   flag = 0
  #     flag = WeekOffMaster.exists?(from: i, employee_id: self.employee_id)
  #   flag
  # end

  # def is_available?
  #   flag = false
  #   week_off_masters = WeekOffMaster.where(day: self.day)
  #   week_off_masters.each do |w|
  #     for i in self.from.to_date..self.to.to_date
  #       if i ==  w.from
  #         flag = true
  #       else i == w.to
  #       	flag = true
  #       end
  #     end
  #   end
  #   flag
  # end
  
end
