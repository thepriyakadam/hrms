class GpsDaily < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_gp
   validates :employee_id, uniqueness: { scope: [:date] }

    def is_present(emp,from,to)
    flag = 0
    	for i in from.to_date..to.to_date
      	flag = GpsDaily.exists?(employee_id: emp,date: i)
      end
    flag
  end

end
	