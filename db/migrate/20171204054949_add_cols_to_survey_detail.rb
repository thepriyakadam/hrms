class AddColsToSurveyDetail < ActiveRecord::Migration
  def change
    add_column :survey_details, :excellent, :boolean
    add_column :survey_details, :very_good, :boolean
    add_column :survey_details, :good, :boolean
    add_column :survey_details, :needs_improvement, :boolean
    add_column :survey_details, :unsatisfied, :boolean
  end
end
