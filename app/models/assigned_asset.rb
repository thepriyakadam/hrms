class AssignedAsset < ActiveRecord::Base
  belongs_to :employee
  belongs_to :asset_type
end
