class ChangeColumnsInAllTables < ActiveRecord::Migration
  def change
  	# remove_reference :employees, :manager_2, index: true, foreign_key: true
  	# add_reference :employees ,:manager_2
  	# remove_reference :goal_ratings, :appraisee, index: true, foreign_key: true
  	# add_reference :goal_ratings ,:appraisee
  	# remove_reference :goal_ratings, :appraiser, index: true, foreign_key: true
  	# add_reference :goal_ratings ,:appraiser
  	# remove_reference :goal_ratings, :reviewer, index: true, foreign_key: true
  	# add_reference :goal_ratings ,:reviewer
  	# remove_reference :goal_ratings, :appraiser_rating, index: true, foreign_key: true
  	# add_reference :goal_ratings ,:appraiser_rating
  	# add_reference :goal_ratings ,:appraisee_rating
  	# remove_reference :goal_ratings, :goal_setter, index: true, foreign_key: true
  	# add_reference :goal_ratings ,:goal_setter
  	# remove_reference :goal_bunches, :appraisee, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:appraisee
  	# remove_reference :goal_bunches, :appraiser, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:appraiser
  	# remove_reference :goal_bunches, :reviewer, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:reviewer
  	# remove_reference :goal_bunches, :reviewer_rating, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:reviewer_rating
  	# remove_reference :goal_bunches, :final_rating, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:final_rating
  	# remove_reference :goal_bunches, :final, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:final
  	# remove_reference :goal_bunches, :r_designation, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:r_designation
  	# remove_reference :goal_bunches, :f_designation, index: true, foreign_key: true
  	# add_reference :goal_bunches ,:f_designation
  	# remove_reference :manager_histories, :manager, index: true, foreign_key: true
  	# add_reference :manager_histories ,:manager
  	# remove_reference :manager_histories, :manager_2, index: true, foreign_key: true
  	# add_reference :manager_histories ,:manager_2
  	# remove_reference :on_duty_requests, :first_reporter, index: true, foreign_key: true
  	# add_reference :on_duty_requests ,:first_reporter
  	# remove_reference :on_duty_requests, :second_reporter, index: true, foreign_key: true
  	# add_reference :on_duty_requests ,:second_reporter
  	# remove_reference :employee_resignations, :final_reporter, index: true, foreign_key: true
  	# add_reference :employee_resignations ,:final_reporter
  	# remove_reference :employee_resignations, :second_reporter, index: true, foreign_key: true
  	# add_reference :employee_resignations ,:second_reporter
  	# add_reference :employee_resignations ,:change_status_employee
  	# remove_reference :joining_details, :replacement, index: true, foreign_key: true
  	# add_reference :joining_details ,:replacement
  	# remove_reference :machine_attendances, :user, index: true, foreign_key: true
  	# add_reference :machine_attendances ,:user
  	# remove_reference :employee_salary_templates, :parent_salary_component, index: true, foreign_key: true
  	# add_reference :employee_salary_templates ,:parent_salary_component
  	# remove_reference :salary_components, :parent, index: true, foreign_key: true
  	# add_reference :salary_components ,:parent
  	# remove_reference :salary_component_templates, :parent, index: true, foreign_key: true
  	# add_reference :salary_component_templates ,:parent
  	# remove_reference :vacancy_masters, :degree_1, index: true, foreign_key: true
  	# add_reference :vacancy_masters ,:degree_1
  	# remove_reference :vacancy_masters, :degree_2, index: true, foreign_key: true
  	# add_reference :vacancy_masters ,:degree_2
  	# remove_reference :vacancy_request_histories, :degree_1, index: true, foreign_key: true
  	# add_reference :vacancy_request_histories ,:degree_1
  	# remove_reference :vacancy_request_histories, :degree_2, index: true, foreign_key: true
  	# add_reference :vacancy_request_histories ,:degree_2
  end
end
