class BonusEmployee < ActiveRecord::Base
  belongs_to :employee

  def self.create_bonus(basic_amount, employee_id, date)
    bonus_master = BonusMaster.find_by_status(true)
    unless bonus_master.nil?
      if basic_amount <= bonus_master.limit_amount
        amount = (basic_amount / 100 * bonus_master.bonus_persentage).round
      else
        amount = (bonus_master.limit_amount / 100 * bonus_master.bonus_persentage).round
      end
      BonusEmployee.new do |b|
        b.employee_id = employee_id
        b.amount = amount
        b.bonus_date = date
        b.save
      end
    end
  end
end
