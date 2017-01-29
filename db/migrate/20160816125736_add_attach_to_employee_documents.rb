class AddAttachToEmployeeDocuments < ActiveRecord::Migration
  def change
    add_attachment :employee_documents, :image
  end
end
