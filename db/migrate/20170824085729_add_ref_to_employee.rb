class AddRefToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :service_master, index: true, foreign_key: true
    add_reference :employees, :resource_pool_master, index: true, foreign_key: true
  end
end
