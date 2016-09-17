module BloodGroupsHelper
  def all_blood_group
    BloodGroup.all.collect { |x| [x.name, x.id] }
  end
end
