class PfMaster < ActiveRecord::Base
  # validates :date_effective, :presence => true
  # validates :is_pf, :presence => true
  # validates :percentage, :presence => true
  # validates :is_active, :presence => true
  validates :base_component, :presence => true

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
