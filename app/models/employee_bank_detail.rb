class EmployeeBankDetail < ActiveRecord::Base
  belongs_to :employee
   # validates :bank_name, :presence => true
   # validates :branch_name, :presence => true
   # validates :address, :presence => true
   # validates :branch_code, :presence => true
   #validate :bank_name_regex
   #validate :branch_name_regex
   #validate :contact_no_regex
   #validate :ifsc_regex
   #validate :branch_code_regex
  #validate :micr_code_regex
  #validate :account_no_regex

def bank_name_regex
    if bank_name.present? and not bank_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :bank_name,"Bank Name allows only Characters"
    end
  end

  def branch_name_regex
    if branch_name.present? and not branch_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :branch_name,"Branch Name allows only Characters"
    end
  end

  def branch_code_regex
    if branch_code.present? and not branch_code.match(/\A[0-9]{1,6}\Z/)
      errors.add :branch_code,"Branch Code allows only Digits Eg:123456"
    end
  end

  def micr_code_regex
    if micr_code.present? and not micr_code.match(/\A[0-9]{1,9}\Z/)
      errors.add :micr_code,"MICR Code allows only Digits Eg:123456789"
    end
  end

def contact_no_regex
    if contact_no.present? and not contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end

   def ifsc_regex
    if ifsc_code.present? and not ifsc_code.match(/^([A-Z]{4})(\d{7})$/)
      errors.add :ifsc_code,"Please specify Correct IFSC Code Eg:ABHY1234567"
    end
   end

def account_no_regex
    if account_no.present? and not account_no.match(/\A[0-9]{1,15}\Z/)
      errors.add :account_no,"Account NO Allows Only Digits allows only Digits"
    end
  end

end
