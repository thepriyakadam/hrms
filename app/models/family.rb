class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nationality
end
