class Department < ActiveRecord::Base
  protokoll :department_code, :pattern => "DEPT###"
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_many :member

  validates :manual_department_code, :presence => true, uniqueness: { case_sensitive: false }
  validates :name, :presence => true
  validates :department_type_id, :presence => true
  #validate :dept_name_regex
  #validate :contact_no_regex


  def dept_name_regex
    if name.present? and not name.match(/\A[A-Za-z&@_ ]{1,30}\Z/)
      errors.add :name,"Dept Name allows only Characters"
    end
  end

def contact_no_regex
    if contact_no.present? and not contact_no.match(/^[0-9-]+$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end

end
