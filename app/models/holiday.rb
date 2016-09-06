class Holiday < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :holiday_date_cannot_be_in_the_past, on: :create

  def holiday_date_cannot_be_in_the_past
    if holiday_date.present? && holiday_date < Date.today
      errors.add(:holiday_date, "can't be in the past")
    end
  end
end
