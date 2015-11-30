class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade

  validates :joining_date, :presence => true
  validates :admin_hr , :presence => true
  validates :tech_hr, :presence => true
  validates :designation, :presence => true
  # validates :account_no, :presence => true
  # validates :employee_grade_id, :presence => true
  # validates :status, :presence => true
  # validates :probation_period, :presence => true
  # validates :notice_period, :presence => true
  # validates :medical_schem, :presence => true

  validate :ref_from_regex
  validate :admin_hr_regex
  validate :desig_regex
  validate :tech_hr_regex


def ref_from_regex
    if reference_from.present? and not reference_from.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :reference_from,"Reference From Allows only Characters"
    end
  end


def admin_hr_regex
    if admin_hr.present? and not admin_hr.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :admin_hr,"Admin HR Allows only Characters"
    end
  end

  def tech_hr_regex
    if tech_hr.present? and not tech_hr.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :tech_hr,"Tech HR Allows only Characters"
    end
  end

   def desig_regex
    if designation.present? and not designation.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :designation,"Designation Allows only Characters"
    end
  end


end
