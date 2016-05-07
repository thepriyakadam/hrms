module SalarySlipLedgersHelper
  def all_bank_name
    Bank.all.collect { |s| [s.name, s.id] }
  end
end
