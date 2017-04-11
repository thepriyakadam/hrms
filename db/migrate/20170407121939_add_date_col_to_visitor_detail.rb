class AddDateColToVisitorDetail < ActiveRecord::Migration
  def change
    add_column :visitor_details, :visiting_date, :date
  end
end
