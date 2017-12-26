class AddColToSurveyDetail < ActiveRecord::Migration
  def change
    add_column :survey_details, :answer, :string
  end
end
