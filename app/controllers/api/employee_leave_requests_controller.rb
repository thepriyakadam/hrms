# class Api::EmployeeLeaveRequestsController < ApiController

# # def  leave_request
# #     @leave_user = params[:employee_id]
# #     @employee = Employee.where(id: @leave_user)
# #     # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
# #     employee_leav_balances = EmployeeLeavBalance.where(employee_id: @leave_user)
# #     render :json => employee_leav_balances.present? ? employee_leav_balances.collect{|elb| {:id => elb.id,:employee_id => elb.employee_id,:leav_category_id => elb.leav_category.name,:no_of_leave => elb.no_of_leave,:expiry_date => elb.expiry_date,:total_leave => elb.total_leave,:is_confirm => elb.is_confirm,:from_date => elb.from_date,:to_date => elb.to_date,:is_active => elb.is_active,:created_at => elb.created_at,:updated_at => elb.updated_at,:carry_forward => elb.carry_forward,:leave_count => elb.leave_count,:leave_count => elb.leave_count,:collapse_value => elb.collapse_value,:working_day => elb.working_day}} : []
# #   end

# #   def  leave_category
# #     # @employee_leav_requests = EmployeeLeavRequest.where('employee_id = ?', @leave_user.try(:employee_id)).order("id DESC")
# #     leav_categories = LeavCategory.where(is_active: true)
# #     render :json => leav_categories.present? ? leav_categories.collect{|lc| {:id => lc.id,:name => lc.name}} : []
# #   end

# # 	def employee_leave_request
# # 		@employee = params[:employee_id]
# # 		@leave_category =params[:leave_category]
# # 		@leave_type = params[:leave_type]
# # 	end

# end