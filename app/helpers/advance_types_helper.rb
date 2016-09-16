module AdvanceTypesHelper
  def all_advance_type
    AdvanceType.all.collect { |x| [x.name, x.id] }
  end
end
