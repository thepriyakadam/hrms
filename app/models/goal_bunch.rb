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
