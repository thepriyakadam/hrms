class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade

  validates :joining_date, :presence => true
  validates :reffernce_from, :presence => true
  validates :admin_hr , :presence => true
  validates :tech_hr, :presence => true
  validates :designation, :presence => true
  validates :ctc, :presence => true
  # validates :account_no, :presence => true
  # validates :employee_grade_id, :presence => true
  validates :status, :presence => true
  validates :probation_period, :presence => true
  validates :notice_period, :presence => true
  validates :medical_schem, :presence => true

  # validate :ref_from_regex
  # validate :admin_hr_regex
  # validate :desig_regex
  # validate :tech_hr_regex


# def ref_from_regex
#     if reffernce_from.present? and not reffernce_from.match(/[a-zA-Z]{50}/)
#       errors.add :reffernce_from,"Reference From Allows only Characters"
#     end
#   end


# def admin_hr_regex
#     if admin_hr.present? and not admin_hr.match(/[a-zA-Z]{50}/)
#       errors.add :admin_hr,"Admin HR Allows only Characters"
#     end
#   end

#   def tech_hr_regex
#     if tech_hr.present? and not tech_hr.match(/[a-zA-Z]{50}/)
#       errors.add :tech_hr,"Tech HR Allows only Characters"
#     end
#   end

#    def desig_regex
#     if designation.present? and not designation.match(/[a-zA-Z]{50}/)
#       errors.add :designation,"Desigantion Allows only Characters"
#     end
#   end


end
