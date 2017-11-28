class PfEmployer < ActiveRecord::Base

	def self.create_string(components)
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    str
  end
end
