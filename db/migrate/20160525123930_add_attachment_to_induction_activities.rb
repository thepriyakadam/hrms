class AddAttachmentToInductionActivities < ActiveRecord::Migration
  def change
  	add_attachment :induction_activities, :avatar
  end
end
