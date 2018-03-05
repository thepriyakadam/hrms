class GoalBunch < ActiveRecord::Base
  belongs_to :period
  belongs_to :employee
  belongs_to :appraisee
  belongs_to :appraiser
  belongs_to :reviewer
  belongs_to :final
  has_many :goal_ratings
  belongs_to :appraisee_rating

  belongs_to :r_designation, class_name: 'EmployeeDesignation'
  belongs_to :f_designation, class_name: 'EmployeeDesignation'
  
  belongs_to :reviewer_rating, class_name: 'Rating'
  belongs_to :final_rating, class_name: 'Rating'

  validates_uniqueness_of :period_id, :scope => :employee_id

  def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        # employee_code = spreadsheet.cell(i,'B').to_i
        # if employee_code == 0
        #   employee_code = spreadsheet.cell(i,'B')
        # else
        #   employee_code = spreadsheet.cell(i,'B').to_i
        # end
        # emp = Employee.find_by(manual_employee_code: employee_code)
        # period_name = spreadsheet.cell(i,'C')
        # period = Period.find_by(name: period_name)
        # if period == nil
        #   period_name = spreadsheet.cell(i,'C')
        #   @period = Period.create(name: period_name,status: true)
        #   period_id = @period.id
        # else
        #   period_id = period.id
        # end

        # type = spreadsheet.cell(i,'D')
        #   perspective = spreadsheet.cell(i,'E')
        #   measure = spreadsheet.cell(i,'F')
        #   target = spreadsheet.cell(i,'G')
        #   weightage = spreadsheet.cell(i,'H')
        #   align_to_supervisor = spreadsheet.cell(i,'I')
        #   employee_id = emp.id
        #   #period_id = period_id
          self_comment = spreadsheet.cell(i,'k')
          self_rating = spreadsheet.cell(i,'L')
          goal_rating_id = spreadsheet.cell(i,'M')

          # @goal_bunch = GoalBunch.where("employee_id = ? AND period_id = ?" , employee_id ,period_id)
          #   if @goal_bunch == nil
          #     goal_bunch = GoalBunch.create(period_id: period_id,employee_id: employee_id)
          #   else
          #     goal_bunch = GoalBunch.where(period_id: period_id,employee_id: employee_id).take
          #   end
     
          int_rating = self_rating.to_i
          rating = int_rating.to_s
        @self_rating = Rating.find_by(value: rating)
        if @self_rating.nil?
          @self_rating_id = nil
        else
          @self_rating_id = @self_rating.id
        end

        goal_rating = GoalRating.find_by(id: goal_rating_id)
        if goal_rating_id.to_i == goal_rating.id
          goal_rating.update(appraisee_comment: self_comment,appraisee_rating_id: @self_rating_id)
        end
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

  def self.appraisergoal_sum(appraiser_goal_ratings)
    appraiser_goal_sum = 0
    appraiser_goal_ratings.each do |goal_rating|     
      weightage = goal_rating.goal_weightage 
      appraiser_rating = goal_rating.appraiser_rating_id 
      appraiser_output = weightage * appraiser_rating.to_i / 100.to_f 
      appraiser_goal_sum = appraiser_goal_sum + appraiser_output 
    end
    appraiser_goal_sum
  end

  def self.appraiser_attribute_sum(appraiser_attribute_ratings)
    appraiser_attribute_sum = 0 
    appraiser_attribute_ratings.each do |goal_rating|     
      weightage = goal_rating.goal_weightage 
      appraiser_rating = goal_rating.appraiser_rating_id 
      appraiser_output = weightage * appraiser_rating.to_i / 100.to_f 
      appraiser_attribute_sum = appraiser_attribute_sum + appraiser_output 
    end
    appraiser_attribute_sum
  end
end
