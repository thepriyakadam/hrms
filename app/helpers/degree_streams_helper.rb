module DegreeStreamsHelper
  def all_degree_stream
    DegreeStream.all.collect { |x| [x.name, x.id] }
  end
end
