module IllnessTypesHelper
  def all_illness_type
     IllnessType.all.collect {|r| [r.name, r.id]}
  end
end
