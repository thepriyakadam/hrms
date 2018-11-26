class AddColToStatusCOffs < ActiveRecord::Migration
  def change
    add_column :status_c_offs, :comment_coff, :string
  end
end
