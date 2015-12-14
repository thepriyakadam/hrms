class AddRefToUniversity < ActiveRecord::Migration
  def change
  	 add_reference :qualifications, :university, index: true, foreign_key: true
    remove_column :qualifications, :university
  end
end
