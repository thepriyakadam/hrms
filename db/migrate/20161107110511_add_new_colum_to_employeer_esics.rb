class AddNewColumToEmployeerEsics < ActiveRecord::Migration
  def change
  	remove_reference :employeer_esics, :empoyee, index: true, foreign_key: true
    add_reference :employeer_esics, :employee, index: true, foreign_key: true
  end
end
