class DepartmentType < ActiveRecord::Base
	has_many :departments


   validates :name, :presence => true
   validates_length_of :name, is: 30,  message:"Dept Name allows upto upto 30 char max"
   validate :name_regex

   def name_regex
    if name.present? and not name.match(/\A[A-Za-z0-9-_]{4,30}\Z/)
      errors.add :name,"Please Enter The Correct Dept Name"
    end
  end


end