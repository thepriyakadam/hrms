class AddAttachmentToInductionMasters < ActiveRecord::Migration
  def change
    add_attachment :induction_masters, :avatar
  end
end
