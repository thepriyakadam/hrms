class AddTrouserToEmployeePhysicals < ActiveRecord::Migration
  def change
    add_column :employee_physicals, :trouser_size, :string
  end
end
