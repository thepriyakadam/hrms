module FoodDeductionsHelper
	def all_food_coupan_master
		FoodCoupanMaster.all.collect {|x| [x.name+' Rs. '+x.price.to_s,x.id]}
	end

  def employee_list_for_food_deduction
    if current_user.class == Group
      Employee.all.collect {|e| [e.manual_employee_code+"  "+e.first_name.to_s+" "+e.last_name.to_s,e.id]}
    else
      if current_user.role.name == "Company"
        Employee.all.collect {|e| [e.manual_employee_code+"  "+e.first_name.to_s+" "+e.last_name.to_s,e.id]}
      elsif current_user.role.name == "CompanyLocation"
        Employee.where(company_location_id: current_user.company_location_id).collect {|e| [e.manual_employee_code+"  "+e.first_name.to_s+" "+e.last_name.to_s,e.id]}
      end 
    end
  end
end
