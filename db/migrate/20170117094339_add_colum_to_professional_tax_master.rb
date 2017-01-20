class AddColumToProfessionalTaxMaster < ActiveRecord::Migration
  def change
    add_reference :professional_tax_masters, :company_location, index: true, foreign_key: true
    add_column :professional_tax_masters, :basis_actual_amount, :boolean
  end
end
