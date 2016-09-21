module DateFormatsHelper
   
  def all_date_format
    DateFormat.all.collect { |x| [x.name, x.id] }
  end

end
