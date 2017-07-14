class Holiday < ActiveRecord::Base
  has_many :employee_attendances
  validates :name, presence: true
  # validate :holiday_date_cannot_be_in_the_past, on: :create

  def holiday_date_cannot_be_in_the_past
    if holiday_date.present? && holiday_date < Date.today
      errors.add(:holiday_date, "can't be in the past")
    end
  end
end
