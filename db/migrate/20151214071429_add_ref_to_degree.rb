class AddRefToDegree < ActiveRecord::Migration
  def change
  	add_reference :qualifications, :degree_type, index: true, foreign_key: true
  	add_reference :qualifications, :degree_stream, index: true, foreign_key: true
  end
end
