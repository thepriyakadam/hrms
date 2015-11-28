class Experince < ActiveRecord::Base
  belongs_to :employee

  validates :no_of_year_experince, :presence => true
  validates :company_name, :presence => true
  validates :designation, :presence => true
  validates :ctc, :presence => true
  validate :no_of_year_experince_regex
   validate :company_name_regex
  validate :designation_regex
  # validates :ctc_regex



def no_of_year_experince_regex
    if no_of_year_experince.present? and not no_of_year_experince.match(/[0-9]{4}/)
      errors.add :no_of_year_experince,"This Field only allows digits"
    end
  end

  def company_name_regex
    if company_name.present? and not company_name.match(/^[a-zA-Z]{50}/)
      errors.add :company_name,"Company Name allows only Characters"
    end
  end

  def designation_regex
    if designation.present? and not designation.match(/[a-zA-Z]{50}/)
      errors.add :designation,"Company Name allows only Characters"
    end
  end

# def ctc_regex
#     if ctc.present? and not ctc.match(/[0-9]{7}/)
#       errors.add :ctc,"CTC allows only Digits"
#     end
#   end

   



end
