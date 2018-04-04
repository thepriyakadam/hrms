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
        self_comment = spreadsheet.cell(i,'k')
        if self_comment == nil
          self_comment = "NA"
        else
          self_comment = spreadsheet.cell(i,'k')
        end
        self_rating = spreadsheet.cell(i,'L')
        goal_rating_id = spreadsheet.cell(i,'M')

          if goal_rating_id == nil
          else    
            goal_rating = GoalRating.find_by(id: goal_rating_id)
        period = Period.find_by(id: goal_rating.period_id)
            int_rating = self_rating.to_i
            rating = int_rating.to_s
            if rating == nil
              @self_rating_id = 0
            else
              @self_rating = Rating.find_by(value: rating.to_f)
              if period.marks == true
                
                if @self_rating == nil
                  rating = Rating.last
                  rating_id = rating.id
                  weightage = goal_rating.goal_weightage
                  if rating_id.to_f < weightage.to_f
                    @self_rating_id = rating_id
                  else
                    weightage_rating = Rating.find_by(value: weightage)
                    weightage_rating_id = weightage_rating.id
                    @self_rating_id = weightage_rating_id.to_f
                  end#rating_id.to_i < weightage.to_i
                else
                  self_rating_value = @self_rating.value
                  weightage = goal_rating.goal_weightage
                  if self_rating_value.to_f < weightage.to_f
                    @self_rating_id = @self_rating.id
                  else
                    weightage_rating = Rating.find_by(value: weightage)
                    weightage_rating_id = weightage_rating.id
                    @self_rating_id = weightage_rating_id.to_f
                  end
                end#@self_rating == nil      
              else
                if @self_rating == nil
                  rating = Rating.last
                  @self_rating_id = rating.id
                else
                  @self_rating_id = @self_rating.id
                end
              end#period.marks == true
            end#rating == nil

            goal_rating = GoalRating.find_by(id: goal_rating_id)
            if goal_rating_id.to_i == goal_rating.id
              goal_rating.update(appraisee_comment: self_comment,appraisee_rating_id: @self_rating_id)
            end
          end# goal_rating_id == nil
    end#do
  end

   def self.import_appraiser_evaluation(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
          appraiser_comment = spreadsheet.cell(i,'M')
          if appraiser_comment == nil
            appraiser_comment = "NA"
          else
            appraiser_comment = spreadsheet.cell(i,'M')
          end

          appraiser_rating = spreadsheet.cell(i,'N')
          goal_rating_id = spreadsheet.cell(i,'O')

          if goal_rating_id == nil
          else
            int_rating = appraiser_rating.to_i
            rating = int_rating.to_s
            if rating == nil
              @appraiser_rating_id = 0
            else
              @appraiser_rating = Rating.find_by(value: rating)
              if @appraiser_rating == nil
                rating = Rating.last
                @appraiser_rating_id = rating.id
              else
                @appraiser_rating_id = @appraiser_rating.id
              end
            end#rating == nil
            goal_rating = GoalRating.find_by(id: goal_rating_id)
            if goal_rating_id.to_i == goal_rating.id
              goal_rating.update(appraiser_comment: appraiser_comment,appraiser_rating_id: @appraiser_rating_id)
            end
          end#goal_rating_id == nil
      end#do
    end

  def self.import_reviewer_evaluation(file)
    spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
      reviewer_comment = spreadsheet.cell(i,'O')
        if reviewer_comment == nil
          reviewer_comment = "NA"
        else
          reviewer_comment = spreadsheet.cell(i,'O')
        end
        goal_rating_id = spreadsheet.cell(i,'P')
        if goal_rating_id == nil
        else
          goal_rating = GoalRating.find_by(id: goal_rating_id)
          goal_rating.update(reviewer_comment: reviewer_comment)
        end#goal_rating_id == nil
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