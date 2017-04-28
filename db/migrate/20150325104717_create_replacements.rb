class CreateReplacements < ActiveRecord::Migration
  def change
    create_table :replacements do |t|

      t.timestamps null: false
    end
  end
end
