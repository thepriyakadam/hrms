class CompanyType < ActiveRecord::Base
	has_many :companies


 # validates :name, :presence => true
 # validates_length_of :name, is: 30,  message:"Name allows upto 30 alphabets"
 # validate  :name_regex

 #  def name_regex
 #    if name.present? and not name.match(/\A[A-Za-z0-9-_]{4,30}\Z/)
 #      errors.add :name,"Please Enter The Correct Company nName"
 #    end
 #  end

end
