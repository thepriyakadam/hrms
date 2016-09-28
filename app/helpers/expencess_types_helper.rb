module ExpencessTypesHelper
  def all_expencess_type
    ExpencessType.all.collect { |x| [x.name, x.id] }
  end
end
