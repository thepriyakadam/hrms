class AddAvatarToVisitorDetail < ActiveRecord::Migration
  def change
   add_attachment :members, :avatar
   add_attachment :groups, :avatar
   add_attachment :capture_resumes, :passport_photo
   add_attachment :capture_resumes, :avatar
   add_attachment :selected_resumes, :avatar
   add_attachment :selected_resumes, :passport_photo
   add_attachment :accident_records, :avatar
   add_attachment :induction_activities, :avatar
   add_attachment :induction_masters, :avatar
   add_attachment :circulars, :avatar
   add_attachment :daily_bill_details, :passport_photo
   add_attachment :daily_bill_details, :avatar_file
   add_attachment :company_policies, :document
   add_attachment :employee_documents, :document
   add_attachment :investment_declarations, :document
   add_attachment :due_templates, :document
   add_attachment :employee_documents, :image
   add_attachment :issue_requests, :document1
   add_attachment :issue_requests, :document2
   add_attachment :employees, :passport_photo
   add_attachment :companies, :company_logo
   add_attachment :circulars, :document
   add_attachment :accident_images, :avatar
   add_attachment :visitor_details, :avatar
  end
end
