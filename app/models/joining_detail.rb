class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade

  validates :joining_date, :presence => true
  validates :admin_hr , :presence => true
  validates :tech_hr, :presence => true
  validates :designation, :presence => true
  validate :ref_from_regex
  validate :admin_hr_regex
 
  validate :tech_hr_regex
  validate :medical_scheme_regex
  validate :probation_period_regex
  validate :notice_period_regex
  validate :status_regex


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

   

  def probation_period_regex
    if probation_period.present? and not probation_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :probation_period,"Please Enter Probation Period In Days or Months"
    end
  end

def notice_period_regex
    if notice_period.present? and not notice_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :notice_period,"Please Enter Notice Period In Days or Months"
    end
  end

def medical_scheme_regex
    if medical_schem.present? and not medical_schem.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :medical_schem,"Medical Scheme Allows only Characters"
    end
  end

  def status_regex
    if status.present? and not status.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :status,"Status Allows only Characters"
    end
  end

end
