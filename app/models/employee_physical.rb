class EmployeePhysical < ActiveRecord::Base
  belongs_to :employee

  validates :height, :presence => true
  validates :weight, :presence => true
  validates :size,:presence => true
#   validate :employee_height_regex
# validate :employee_weight_regex


# def employee_height_regex
#     if height.present? and not height.match(/^[0-9]+\'[ ]?([0-9]{1,2}[\"]?|)$/)
#       errors.add :height,"Please Enter correct Height Eg.5'11"
#     end
#   end

# def size_regex
#     if size.present? and not height.match(/^[0-9]+\'[ ]?([0-9]{1,2}[\"]?|)$/)
#       errors.add :size,"Please Enter correct Height Eg.5'11"
#     end
#   end



# def employee_weight_regex
#     if weight.present? and not weight.match(/\d{1,3}(kg|lb)/)
#       errors.add :weight,"This Field allows only Numbers"
#     end
#   end

# def employee_weight_regex
#     if employee_weight_regex.present? and not employee_weight_regex.match(/[0-9]{12}/)
#       errors.add :employee_weight_regex,"This Field Allows Numbers Only"
#     end
#   end

end
