module EmployeeNominationsHelper
	def all_nomination_type
    NominationMaster.all.collect { |x| [x.name, x.id] }
  end
  def all_family_type
    Family.all.collect { |x| [x.name, x.id] }
  end
end
