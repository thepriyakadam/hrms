class AddColToEmployeeDocuments < ActiveRecord::Migration
  def change
   add_attachment :employee_documents, :document
  end
end
