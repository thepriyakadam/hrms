class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade
  belongs_to :employee_designation
  belongs_to :cost_center
  belongs_to :employee_category
  belongs_to :payment_mode
  belongs_to :department
  belongs_to :company_location
  belongs_to :reserved_category

  validates :employee_id, presence: true, uniqueness: { case_sensitive: false }
  # validates :joining_date, presence: true
  # validates :employee_designation_id, presence: true
  # validate :medical_scheme_regex
  # validate :probation_period_regex
  # validate :notice_period_regex
  # validate :status_regex

  def probation_period_regex
    if probation_period.present? && !probation_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :probation_period, 'Please Enter Probation Period In Days or Months'
    end
  end

  def notice_period_regex
    if notice_period.present? && !notice_period.match(/\A[0-9A-Za-z_ ]{1,30}\Z/)
      errors.add :notice_period, 'Please Enter Notice Period In Days or Months'
    end
    end

  def medical_scheme_regex
    if medical_schem.present? && !medical_schem.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :medical_schem, 'Medical Scheme Allows only Characters'
    end
    end

  def status_regex
    if status.present? && !status.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :status, 'Status Allows only Characters'
    end
  end

  def self.create_string(components)
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    str
  end
end