class AddColToManagerHistories < ActiveRecord::Migration
  def change
    add_column :manager_histories, :effective_from, :date
    add_column :manager_histories, :effective_to, :date
  end
end
