class AddColToMasters < ActiveRecord::Migration
  def change
			add_column :company_types, :is_confirm, :boolean
			add_column :department_types, :is_confirm, :boolean
			add_column :cost_centers, :is_confirm, :boolean
			add_column :payment_modes, :is_confirm, :boolean
			add_column :banks, :is_confirm, :boolean
			add_column :advance_types, :is_confirm, :boolean
			add_column :expencess_types, :is_confirm, :boolean
			add_column :food_coupan_masters, :is_confirm, :boolean
			add_column :esic_masters, :is_confirm, :boolean
			add_column :pf_masters, :is_confirm, :boolean
			add_column :professional_taxes, :is_confirm, :boolean
			add_column :overtime_masters, :is_confirm, :boolean
			add_column :well_faires, :is_confirm, :boolean
			add_column :bonus_masters, :is_confirm, :boolean
			add_column :retention_moneys, :is_confirm, :boolean
			add_column :employee_grades, :is_confirm, :boolean
			add_column :employee_types, :is_confirm, :boolean
			add_column :employee_categories, :is_confirm, :boolean
			add_column :employee_designations, :is_confirm, :boolean
			add_column :roles, :is_confirm, :boolean
			add_column :nationalities, :is_confirm, :boolean
			add_column :reserved_categories, :is_confirm, :boolean
			add_column :religions, :is_confirm, :boolean
			add_column :relation_masters, :is_confirm, :boolean
			
			add_column :nomination_masters, :is_confirm, :boolean
			add_column :illness_types, :is_confirm, :boolean
			add_column :degrees, :is_confirm, :boolean
			add_column :degree_types, :is_confirm, :boolean
			add_column :degree_streams, :is_confirm, :boolean
			add_column :universities, :is_confirm, :boolean
			add_column :years, :is_confirm, :boolean
			add_column :asset_types, :is_confirm, :boolean
			add_column :reward_types, :is_confirm, :boolean
			add_column :reward_owners, :is_confirm, :boolean
			add_column :training_topic_masters, :is_confirm, :boolean
			add_column :travel_expence_types, :is_confirm, :boolean
			add_column :travel_modes, :is_confirm, :boolean
			add_column :travel_options, :is_confirm, :boolean
			add_column :currency_masters, :is_confirm, :boolean
			add_column :root_cause_masters, :is_confirm, :boolean
			add_column :periods, :is_confirm, :boolean
			add_column :performance_activities, :is_confirm, :boolean
			add_column :performance_calendars, :is_confirm, :boolean
			add_column :goal_perspectives, :is_confirm, :boolean
			add_column :attribute_masters, :is_confirm, :boolean
			add_column :ratings, :is_confirm, :boolean
			add_column :interview_attributes, :is_confirm, :boolean
			add_column :interview_decisions, :is_confirm, :boolean
			add_column :interview_evalutions, :is_confirm, :boolean
			add_column :interview_types, :is_confirm, :boolean
			add_column :question_masters, :is_confirm, :boolean
			add_column :about_companies, :is_confirm, :boolean
			add_column :about_bosses, :is_confirm, :boolean
			add_column :leaving_reasons, :is_confirm, :boolean
			add_column :project_masters, :is_confirm, :boolean
			add_column :leav_categories, :is_confirm, :boolean
			add_column :salary_components, :is_confirm, :boolean
  end
end
