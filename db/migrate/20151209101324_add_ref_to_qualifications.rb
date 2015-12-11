class AddRefToQualifications < ActiveRecord::Migration
  def change
    add_reference :qualifications, :degree, index: true, foreign_key: true
    remove_column :qualifications, :course
  end
end
