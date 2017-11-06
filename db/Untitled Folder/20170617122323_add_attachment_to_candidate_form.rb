class AddAttachmentToCandidateForm < ActiveRecord::Migration
  def change
  	add_attachment :candidate_forms, :document1
    add_attachment :candidate_forms, :document2
  end
end
