class GoalRating < ActiveRecord::Base
  scope :find_lazy, -> (current_user,goal_bunch) { where(:id => current_user, ) }
  belongs_to :goal_bunch
  belongs_to :goal_perspective
  belongs_to :goal_setter
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :appraiser_rating
  belongs_to :reviewer
  belongs_to :attribute_master
  belongs_to :appraisee_rating

  belongs_to :appraisee, class_name: 'Employee'
  belongs_to :appraiser, class_name: 'Employee'
  belongs_to :reviewer, class_name: 'Employee'

  belongs_to :appraisee_rating, class_name: 'Rating'
  belongs_to :appraiser_rating, class_name: 'Rating'
  #validates :goal_perspective_id, presence: true
  #validates :attribute_master_id, presence: true
  validates_length_of :goal_measure, :maximum => 255
  
  def self.import(file,emp,goal_bunch)
     goal_rating = GoalRating.where(appraisee_id: emp,period_id: goal_bunch.period_id)
     weigh = 0
      goal_rating.each do |g|
        weigh = g.goal_weightage + weigh
      end
      weigh
     previous_weightage = weigh

     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
         weightage = spreadsheet.cell(i,'I')
          weightage_sum = weightage.to_f + previous_weightage.to_f
          previous_weightage = weightage_sum

        employee_code = spreadsheet.cell(i,'B').to_i
        if employee_code == 0
          employee_code = spreadsheet.cell(i,'B')
        else
          employee_code = spreadsheet.cell(i,'B').to_i
        end
        emp = Employee.find_by(manual_employee_code: employee_code)
        period_name = spreadsheet.cell(i,'C')
        period = Period.find_by(name: period_name)
        if period == nil
          period_name = spreadsheet.cell(i,'C')
          @period = Period.create(name: period_name,status: true)
          period_id = @period.id
        else
          period_id = period.id
        end

        type = spreadsheet.cell(i,'D')
       
        if type == "Goal" || type == "Attribute"
          
          if weightage_sum <= 100
            weightage_sum1 = true
            perspective = spreadsheet.cell(i,'E')
            activity = spreadsheet.cell(i,'F')
            measure = spreadsheet.cell(i,'G')
            target = spreadsheet.cell(i,'H')
            weightage = spreadsheet.cell(i,'I')
            align_to_supervisor = spreadsheet.cell(i,'J')
            employee_id = emp.id
            
            @goal_bunch = GoalBunch.where("employee_id = ? AND period_id = ?" , employee_id ,period_id)
            #GoalBunch.where(employee_id: employee_id) && GoalBunch.where(period_id: period_id)
              if @goal_bunch == nil
                goal_bunch = GoalBunch.create(period_id: period_id,employee_id: employee_id)
              else
                goal_bunch = GoalBunch.where(period_id: period_id,employee_id: employee_id).take
              end

              if type == "Goal"
                goal_perspective = GoalPerspective.where(name: perspective,status: true).take

                if goal_perspective == nil
                  perspective = spreadsheet.cell(i,'E')
                  last_goal_perspective = GoalPerspective.last
                  new_id = last_goal_perspective.id.to_i + 1

                  goal = GoalPerspective.find_by(name: perspective)
                  if goal.nil?
                  goal_perspective = GoalPerspective.create(id: new_id,name: perspective,status: true)
                  goal_perspective_id = goal_perspective.id
                  else
                  goal_perspective = goal.update(status: true)
                  goal_perspective_id = goal.id
                  end
                  GoalRating.create(goal_bunch_id: goal_bunch.id,goal_perspective_id: goal_perspective_id,goal_weightage: weightage,goal_measure: measure,
                  activity: activity,target: target,aligned: align_to_supervisor,period_id: period.id,goal_type: type,goal_setter_id: emp.id,
                  appraisee_id: emp.id,appraiser_id: emp.manager_id)

                else
                  goal_perspective_id = goal_perspective.id
                  GoalRating.create(goal_bunch_id: goal_bunch.id,goal_perspective_id: goal_perspective_id,goal_weightage: weightage,goal_measure: measure,
                  activity: activity,target: target,aligned: align_to_supervisor,period_id: period.id,goal_type: type,goal_setter_id: emp.id,
                  appraisee_id: emp.id,appraiser_id: emp.manager_id)
                end
                 
              
              else
                attribute_master = AttributeMaster.where(name: perspective,status: true).take
                  
                  if attribute_master == nil 
                    perspective = spreadsheet.cell(i,'E')
                    last_attribute = AttributeMaster.last
                    last_code = last_attribute.code
                    new_code = last_code.to_i + 1
                    new_id = last_attribute.id.to_i + 1

                    attribute = AttributeMaster.find_by(name: perspective)
                    if attribute.nil?
                    attribute_master = AttributeMaster.create(id: new_id,code: new_code,name: perspective,status: true)
                    attribute_id = attribute_master.id
                    else
                    attribute_master = attribute.update(status: true)
                    attribute_id = attribute.id
                    end
                    
                    GoalRating.create(goal_bunch_id: goal_bunch.id,attribute_master_id: attribute_id,goal_weightage: weightage,goal_measure: measure,
                    activity: activity,target: target,aligned: align_to_supervisor,period_id: period.id,goal_type: type,goal_setter_id: emp.id,
                    appraisee_id: emp.id,appraiser_id: emp.manager_id)
                
                  else
                    attribute_master_id = attribute_master.id
                    GoalRating.create(goal_bunch_id: goal_bunch.id,attribute_master_id: attribute_master_id,goal_weightage: weightage,goal_measure: measure,
                    activity: activity,target: target,aligned: align_to_supervisor,period_id: period.id,goal_type: type,goal_setter_id: emp.id,
                    appraisee_id: emp.id,appraiser_id: emp.manager_id)
                  end
              end#if type
          else#weightage_sum <= 100  
            weightage_sum1 = false
             return @weightage_sum = weightage_sum1
          end#weightage_sum <= 100 
        else
          # flash[:alert] = "Type not available!"
        end #type == "Goal" || type == "Attribute" 

      end#do
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def goal_weightage_sum(goal_bunch, goal_rating)
    previous_weightage = goal_bunch.goal_ratings.sum(:goal_weightage)
    previous_weightage + goal_rating.goal_weightage
  end

  def goal_weightage_sumdate(goal_bunch, goal_weightage, params)
    previous_goals = GoalRating.where(goal_bunch: goal_bunch.id)
    prev_total = previous_goals.sum(:goal_weightage) - goal_weightage.to_i
    prev_total + params[:goal_rating][:goal_weightage].to_i
  end

  def goal_id_sum(goal_rating)
    previous_weightage = GoalRating.where(goal_perspective_id: goal_rating.goal_perspective_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    weightage + goal_rating.goal_weightage
  end

  def attribute_id_sum(goal_rating)
    previous_weightage = GoalRating.where(attribute_master_id: goal_rating.attribute_master_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    weightage + goal_rating.goal_weightage
  end

  def goal_id_sum_update(goal_rating,weightage1)
    previous_weightage = GoalRating.where(goal_perspective_id: goal_rating.goal_perspective_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    goal_rating1 = previous_weightage.find_by(id: goal_rating.id)
    weigh = goal_rating1.goal_weightage
    weightage = previous_weightage.sum(:goal_weightage) - weigh.to_i
     weightage + weightage1
  end

  def attribute_id_sum_update(goal_rating,weightage1)
    previous_weightage = GoalRating.where(attribute_master_id: goal_rating.attribute_master_id,appraisee_id: goal_rating.appraisee_id,goal_bunch_id: goal_rating.goal_bunch_id)
    weightage = previous_weightage.sum(:goal_weightage)
    goal_rating1 = previous_weightage.find_by(id: goal_rating.id)
    weigh = goal_rating1.goal_weightage
    weightage = previous_weightage.sum(:goal_weightage) - weigh.to_i
     weightage + weightage1
  end
end
