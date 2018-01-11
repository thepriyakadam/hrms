class CreateCertificateMasters < ActiveRecord::Migration
  def change
    create_table :certificate_masters do |t|
      t.string :name
      t.string :description
      t.boolean :status
      t.boolean :confirm

      t.timestamps null: false
    end
  end
end
