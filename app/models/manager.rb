class Manager < ActiveRecord::Base
has_many :rembursments
has_many :reportingmasterrembursments
end
