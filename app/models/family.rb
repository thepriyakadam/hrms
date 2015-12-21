class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :blood_group

  validates :relation, :presence => true
  validates :f_name, :presence => true
  validates :l_name , :presence => true

  validate :adhar_no_regex 
  validate :pan_no_regex

 

  def adhar_no_regex
    if adhar_no.present? and not adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no,"Please specify Correct Adhar Number"
    end
  end

  def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number eg:ABCDE1234A"
    end
   end

  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
      errors.add :email, "This is not a valid email format"
    end
  end
end
