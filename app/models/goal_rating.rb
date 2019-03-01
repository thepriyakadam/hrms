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
  #validates_length_of :goal_measure, :maximum => 255
  
  has_attached_file :document,
    :path => "attachments/attach_company_policy/:basename.:extension"

  # validates_attachment_presence :avatar
  validates_attachment_size :document, less_than: 15.megabytes
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/txt application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
 
  def self.import(file,emp,goal_bunch)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        goal_rating = GoalRating.where(appraisee_id: emp,period_id: goal_bunch.period_id)
        
        weigh = 0
        goal_rating.each do |g|
          weigh = g.goal_weightage + weigh
          weigh.round
        end
        weigh
        previous_weightage = weigh

        weightage = spreadsheet.cell(i,'I')
          weightage_sum = weightage.to_f + previous_weightage.to_f
          weight = weightage_sum

          employee_code = spreadsheet.cell(i,'B').to_i
      if weight <= 100

        if employee_code == nil
        else

          if employee_code == 0
            employee_code = spreadsheet.cell(i,'B')
          else
            employee_code = spreadsheet.cell(i,'B').to_i
          end
          emp = Employee.find_by(manual_employee_code: employee_code)
          period_name = spreadsheet.cell(i,'C')

          if emp != nil && period_name != nil
            
            period = Period.find_by(name: period_name)
            if period != nil
              period_id = period.id

              type = spreadsheet.cell(i,'D')
             
              if type == "Goal" || type == "Attribute"
                #if weightage_sum <= 100
                  weightage_sum1 = true
                  perspective = spreadsheet.cell(i,'E')
                  activity = spreadsheet.cell(i,'F')
                    if activity == nil
                      activity = "NA"
                    else
                      activity = spreadsheet.cell(i,'F')
                    end
                  measure = spreadsheet.cell(i,'G')
                    if measure == nil
                      measure = "NA"
                    else
                      measure = spreadsheet.cell(i,'G')
                    end
                  target = spreadsheet.cell(i,'H')
                    if target == nil
                      target = "NA"
                    else
                      target = spreadsheet.cell(i,'H')
                    end
                  weightage = spreadsheet.cell(i,'I')
                    if weightage == nil
                      weightage = "NA"
                    else
                      weightage = spreadsheet.cell(i,'I')
                    end

                  align_to_supervisor = spreadsheet.cell(i,'J')
                    if align_to_supervisor == nil
                      align_to_supervisor = "NA"
                    else
                      align_to_supervisor = spreadsheet.cell(i,'J')
                    end
                  employee_id = emp.id
                  
                  @goal_bunch = goal_bunch
                  goal_bunch_id = @goal_bunch.id

                    if type == "Goal"
                      goal_perspective = GoalPerspective.where(name: perspective,status: true).take

                      if goal_perspective == nil
                        perspective = spreadsheet.cell(i,'E')
                        if perspective == nil
                          perspective = "NA"
                        else
                          perspective = spreadsheet.cell(i,'E')
                        end

                        last_goal_perspective = GoalPerspective.last
                          if last_goal_perspective == nil
                            last_goal_perspective_id = 0
                          else
                            last_goal_perspective_id = last_goal_perspective.id
                          end
                        new_id = last_goal_perspective_id.to_i + 1

                        goal = GoalPerspective.find_by(name: perspective)
                        if goal.nil?
                        goal_perspective = GoalPerspective.create(id: new_id,name: perspective,status: true)
                        goal_perspective_id = goal_perspective.id
                        else
                        goal_perspective = goal.update(status: true)
                        goal_perspective_id = goal.id
                        end

                        GoalRating.create(goal_bunch_id: goal_bunch_id,goal_perspective_id: goal_perspective_id,goal_weightage: weightage,
                          goal_measure: measure,activity: activity,target: target,aligned: align_to_supervisor,period_id: period_id,
                          goal_type: type,goal_setter_id: emp.id,appraisee_id: emp.id,appraiser_id: emp.manager_id)

                      else
                        goal_perspective_id = goal_perspective.id
                        GoalRating.create(goal_bunch_id: goal_bunch_id,goal_perspective_id: goal_perspective_id,goal_weightage: weightage,goal_measure: measure,
                        activity: activity,target: target,aligned: align_to_supervisor,period_id: period_id,goal_type: type,goal_setter_id: emp.id,
                        appraisee_id: emp.id,appraiser_id: emp.manager_id)
                      end
                       
                    
                    else
                      attribute_master = AttributeMaster.where(name: perspective,status: true).take
                        
                        if attribute_master == nil 
                          perspective = spreadsheet.cell(i,'E')
                          if perspective == nil
                            perspective = "NA"
                          else
                            perspective = spreadsheet.cell(i,'E')
                          end
                          last_attribute = AttributeMaster.last
                          if last_attribute == nil
                            last_attribute_id = 0
                            last_attribute_code = 0
                          else
                            last_attribute_id = last_attribute.id
                            last_attribute_code = last_attribute.code
                          end
                          new_code = last_attribute_code.to_i + 1
                          new_id = last_attribute_id.to_i + 1

                          attribute = AttributeMaster.find_by(name: perspective)
                          if attribute.nil?
                          attribute_master = AttributeMaster.create(id: new_id,code: new_code,name: perspective,status: true)
                          attribute_id = attribute_master.id
                          else
                          attribute_master = attribute.update(status: true)
                          attribute_id = attribute.id
                          end
                          
                          GoalRating.create(goal_bunch_id: goal_bunch_id,attribute_master_id: attribute_id,goal_weightage: weightage,goal_measure: measure,activity: activity,target: target,aligned: align_to_supervisor,period_id: period_id,goal_type: type,goal_setter_id: emp.id,appraisee_id: emp.id,appraiser_id: emp.manager_id)
                      
                        else
                          attribute_master_id = attribute_master.id
                          GoalRating.create(goal_bunch_id: goal_bunch_id,attribute_master_id: attribute_master_id,goal_weightage: weightage,goal_measure: measure,
                          activity: activity,target: target,aligned: align_to_supervisor,period_id: period_id,goal_type: type,goal_setter_id: emp.id,
                          appraisee_id: emp.id,appraiser_id: emp.manager_id)
                        end
                    end#if type
                
              else
                # flash[:alert] = "Type not available!"
              end #type == "Goal" || type == "Attribute" 
            end#period != nil
          end#emp == nil
        end#employee_code == nil
      else#weightage_sum <= 100  
        weightage_sum1 = false
        return @weightage_sum = weightage_sum1
      end#weight <=100
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
