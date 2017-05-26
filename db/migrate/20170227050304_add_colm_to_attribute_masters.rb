class AddColmToAttributeMasters < ActiveRecord::Migration
  def change
    add_column :attribute_masters, :attribute_weightage, :boolean
    add_column :attribute_masters, :from, :string
    add_column :attribute_masters, :to, :string
  end
end
