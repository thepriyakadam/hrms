class Ability
  include CanCan::Ability
  def initialize(user)
    if user.class == Group
      can :manage, :all
    elsif user.class == Member
      if user.role.name == 'Company'
        can :manage, :all
      elsif user.role.name == 'CompanyLocation'
        # can :manage, Employee, :joining_detail => { :company_location_id => user.company_location_id }
        can :manage, [Employee, JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family, Award, Certification]
        can :manage, CompanyLeav
        can [:read, :new], Department
        # can :manage, EmployeeLeavBalance, :employee => {:joining_detail => { :company_location_id => user.company_location_id }}
        can :manage, EmployeeLeavBalance
        can :manage, EmployeeLeavRequest
        can :manage, EmployeeSalaryTemplate
        can :manage, EmployeeTemplate
        can :manage, AdvanceSalary
        can :manage, Instalment
        can :manage, ParticularLeaveRecord
        can [:read, :create, :update], SocietyMemberShip
      elsif user.role.name == 'Department'
        can :read, Employee
        can :manage, EmployeeLeavRequest
      elsif user.role.name == 'Supervisor'
        can :read, Employee
        can :manage, EmployeeLeavRequest
      elsif user.role.name == 'Employee'
        can :read, Employee, id: user.employee_id
        can :read, [JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family]
        can :manage, EmployeeLeavRequest, employee_id: user.employee_id
        can :read, EmployeeTemplate, employee_id: user.employee_id
        can :read, AdvanceSalary, employee_id: user.employee_id
        can :read, Attendance, employee_id: user.employee_id
      elsif user.role.name == 'SalaryAccount'
        can :read, Employee
        can :manage, EmployeeLeavRequest
        can :manage, AdvanceSalary
      elsif user.role.name == 'Account'
        can :read, Employee
        can :manage, EmployeeLeavRequest
        can :manage, AdvanceSalary
      end
    end
  end
end
