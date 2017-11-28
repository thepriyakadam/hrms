class EmployeeGp < ActiveRecord::Base

  validates :employee_id, uniqueness: { scope: [:from_date, :to_date] }
  belongs_to :employee

   def is_present(emp,from,to)
    flag = 0
    	for i in from.to_date..to.to_date
      	flag = GpsDaily.exists?(employee_id: emp,date: i)
      end
    flag
  end
  
end
