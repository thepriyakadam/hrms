class ImportFilesController < ApplicationController

    def import_company_type
		file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     CompanyType.import_company_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_department_type
		file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     DepartmentType.import_department_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_bank
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Bank.import_bank(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_policy_type
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     PolicyType.import_policy_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_employee_code_master
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     EmployeeCodeMaster.import_employee_code_master(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_employee_type
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     EmployeeType.import_employee_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_nationality
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Nationality.import_nationality(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_religion
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Religion.import_religion(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_relation
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     RelationMaster.import_relation(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_blood
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     BloodGroup.import_blood(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_illness
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     IllnessType.import_illness(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_employee_grade
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     EmployeeGrade.import_employee_grade(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_employee_category
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     EmployeeCategory.import_employee_category(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_designation
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     EmployeeDesignation.import_designation(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_asset_type
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     AssetType.import_asset_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_checklist
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     JoiningChecklistMaster.import_checklist(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_qualification
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Degree.import_qualification(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_qualification_level
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     DegreeType.import_qualification_level(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_specialization
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     DegreeStream.import_specialization(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_univercity
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     University.import_univercity(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_year
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Year.import_year(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_period
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Period.import_period(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_rating
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Rating.import_rating(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_goal
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     GoalPerspective.import_goal(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_attribute
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     AttributeMaster.import_attribute(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_activity
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     PerformanceActivity.import_activity(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_calender
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     PerformanceCalendar.import_calender(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_skillset
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     InterviewAttribute.import_skillset(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_evaluation
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     InterviewDecision.import_evaluation(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

   def import_criteria
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     InterviewEvalution.import_criteria(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_interview_type
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     InterviewType.import_interview_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_target_company
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     TargetCompany.import_target_company(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_question_master
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     QuestionMaster.import_question_master(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_about_company
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     AboutCompany.import_about_company(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_about_manager
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     AboutBoss.import_about_manager(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

		def import_leaving_reason
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     LeavingReason.import_leaving_reason(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

    def import_training_course
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     TrainingTopicMaster.import_training_course(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_reward_type
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     RewardType.import_reward_type(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_reward_owner
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     RewardOwner.import_reward_owner(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_root_cause_master
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     RootCauseMaster.import_root_cause_master(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

	def import_project_master
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     ProjectMaster.import_project_master(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

   def import_rembursment_master
	  file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to company_type_import_import_files_path
      else
     Rembursmentmaster.import_rembursment_master(params[:file])
     redirect_to company_type_import_import_files_path, notice: "File imported."
     end
	end

end