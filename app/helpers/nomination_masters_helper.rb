module NominationMastersHelper
  def all_nomination_type
    NominationMaster.all.collect { |x| [x.name, x.id] }
  end
end
