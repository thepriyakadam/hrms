class Certification < ActiveRecord::Base
  belongs_to :qualification


  def first_name_regex
    if first_name.present? and not first_name.match(/\A[A-Za-z_]{1,30}\Z/)
      errors.add :first_name,"First Name allows only Characters"
    end
  end
  
end
