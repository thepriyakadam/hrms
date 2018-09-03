module ExpenceOpestionsHelper
	  def all_expence_type
    ExpenceOpestion.all.collect { |x| [x.name] }
  end
end
