module SectionsHelper
  def section_all
   Section.where(status: true).collect { |x| [x.code, x.id] }
  end
end
