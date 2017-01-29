class AddNewColumnToDueTemplates < ActiveRecord::Migration
  def change
    add_attachment :due_templates, :document
  end
end
