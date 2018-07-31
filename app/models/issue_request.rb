class IssueRequest < ActiveRecord::Base
  belongs_to :issue_master
  belongs_to :issue_tracker_member
  belongs_to :issue_tracker_group
  belongs_to :employee
  has_many :issue_lockers
  belongs_to :issue_root_cause

  validates :issue_tracker_group_id, presence: true
  validates :issue_master_id, presence: true
  validates :issue_priority, presence: true
  
  validates :description,presence: true,
    length: {maximum: 255},
    on: :create,
    allow_nil: false



  has_attached_file :document1, :path => "attachments/attach_resume/:basename.:extension"

  has_attached_file :document2, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :document2, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'

  def self.filter_records(current_user)
    @issue_requests =  if current_user.class == Group
      IssueRequest.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
        @employees = Employee.all
        IssueRequest.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id)
        IssueRequest.where(employee_id: @employees)  
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
        IssueRequest.where(employee_id: @employees)  
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id)
        IssueRequest.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        IssueRequest.where(employee_id: current_user.employee_id)
      end
    end
  end
end
