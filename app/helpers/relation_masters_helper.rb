module RelationMastersHelper
  def all_relation_type
  	RelationMaster.all.collect {|r| [r.name, r.id]}
  end
end
