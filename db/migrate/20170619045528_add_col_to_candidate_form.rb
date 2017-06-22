class AddColToCandidateForm < ActiveRecord::Migration
  def change
    add_reference :candidate_forms, :degree, index: true, foreign_key: true
  end
end
