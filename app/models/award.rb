class Award < ActiveRecord::Base
  belongs_to :employee
validate :award_name_regex
validate :award_from

  
def award_name_regex
    if award_name.present? and not award_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :award_name,"Award Name allows only Characters"
    end
  end

def award_name_regex
    if award_from.present? and not award_from.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :award_from,"Award Name allows only Characters"
    end
  end

end
