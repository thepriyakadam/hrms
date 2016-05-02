class AddEmployeeDesignationRefToCaptureResumes < ActiveRecord::Migration
  def change
    add_reference :capture_resumes, :employee_designation, index: true, foreign_key: true
  end
end
