class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.references :certificate_master, index: true, foreign_key: true
      t.text :h1_start
      t.text :h1_end
      t.text :h2_start
      t.text :h2_end
      t.text :b1_start
      t.text :b1_end
      t.text :b2_start
      t.text :b2_end
      t.text :b3_start
      t.text :b3_end
      t.text :b4_start
      t.text :b4_end
      t.text :b5_start
      t.text :b5_end
      t.text :f1_start
      t.text :f1_end
      t.text :f2_start
      t.text :f2_end

      t.timestamps null: false
    end
  end
end
