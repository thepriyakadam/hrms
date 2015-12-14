module QualificationsHelper
	def all_year
		Year.all.collect {|x| [x.name,x.id]}
	end

	def all_degree_type
		DegreeType.all.collect {|x| [x.name,x.id]}
	end

	def all_degree_stream
		DegreeStream.all.collect {|x| [x.name,x.id]}
	end
end
