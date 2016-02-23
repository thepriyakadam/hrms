class Ability
  include CanCan::Ability
  def initialize(user)
    if user.class == Group
      can :manage, :all
    elsif user.class == Member
      if user.role.name == 'Company'
        can :manage, :all
      elsif user.role.name == 'CompanyLocation'
        #can :manage, Employee, :joining_detail => { :company_location_id => user.company_location_id }
        can :manage, Employee, :company_location_id => user.company_location_id
        can :manage, CompanyLeav
        can :manage, Department, :company_location_id => user.company_location_id
        #can :manage, EmployeeLeavBalance, :employee => {:joining_detail => { :company_location_id => user.company_location_id }}
        can :manage, EmployeeLeavBalance
        can :manage, EmployeeLeavRequest, :employee => {:joining_detail => { :department_id => user.department_id }}
      elsif user.role.name == 'Department'
        can :manage, Employee
        can :manage, EmployeeLeavRequest
        
      elsif user.role.name == 'Employee'
        can [:read, :create, :update, :destroy], [EmployeeLeavRequest,CompanyLeav,Award,Family,Qualification,Skillset,Experience,Certification,EmplyeePhysical,LeavCancelled]
      end
    end
  end
end
