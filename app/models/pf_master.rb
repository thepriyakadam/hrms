class PfMaster < ActiveRecord::Base

  def self.create_string(components)
    str = String.new
    i = 0
    components.each do |c|
      if i == 0
        str = c.to_s
      else
        str = str.to_s+","+c.to_s
      end
      i = i + 1
    end
    str
  end
end
