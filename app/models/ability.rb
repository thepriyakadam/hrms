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
        can :manage, EmployeeLeavRequest
        can :manage, EmployeeSalaryTemplate
        can :manage, EmployeeTemplate
      elsif user.role.name == 'Department'
        can :manage, Employee
        can :manage, EmployeeLeavRequest
        
      elsif user.role.name == 'Employee'
        #[EmployeeLeavRequest,CompanyLeav,Award,Family,Qualification,Skillset,Experience,Certification,EmplyeePhysical,LeavCancelled]
        can :read, Employee, :id => user.employee_id
        can :read, [JoiningDetail,EmployeeBankDetail,Qualification,Experience,Skillset,EmployeePhysical,Family]
        can :manage, EmployeeLeavRequest, :employee_id => user.employee_id
        can :read, EmployeeTemplate, :employee_id => user.employee_id
        can :read, AdvanceSalary, :employee_id => user.employee_id
        can :read, Attendance, :employee_id => user.employee_id
      end
    end
  end
end
