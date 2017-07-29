class Ability
  include CanCan::Ability
  def initialize(user)
    if user.class == Group
      can :manage, :all
    elsif user.class == Member
      if user.role.name == 'GroupAdmin' || user.role.name == "GroupTimeManagement" 
       can :manage, :all
      elsif user.role.name == 'Admin'|| user.role.name == "AdminTimeManagement" 
       can :manage, :all
      elsif user.role.name == 'Branch'|| user.role.name == "TimeAndAttendance" 
        # can :manage, Employee, :joining_detail => { :company_location_id => user.company_location_id }
        # can :manage, [Employee, JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family, Award, Certification, Award, EmployeeNomination]
        # can :manage, CompanyLeav
        # can [:read, :new], Department
        # can :manage, EmployeeLeavBalance, :employee => {:joining_detail => { :company_location_id => user.company_location_id }}
        # can :manage, EmployeeLeavBalance
        # can :manage, EmployeeLeavRequest
        # can :manage, EmployeeSalaryTemplate
        # can :manage, EmployeeTemplate
        # can :manage, AdvanceSalary
        # can :manage, Instalment
        # can :manage, ParticularLeaveRecord
        # can :manage, [GoalBunch, GoalRating]
        # can :manage, [TravelRequest, DailyBillDetail]
        # can [:read, :create, :update], SocietyMemberShip
        can :manage, :all
      elsif user.role.name == 'HOD'
        can :read, Employee
        can :read, [JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family]
        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, [EmployeeLeavRequest, ParticularLeaveRecord]
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
        can :manage, [OnDutyRequest, ParticularOdRecord]
      elsif user.role.name == 'Supervisor'
        can :read, Employee
        can :read, [JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family]
        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, EmployeeLeavRequest
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
        can :manage, [OnDutyRequest, ParticularOdRecord]
      elsif user.role.name == 'Employee'
        can :read, Employee, id: user.employee_id
        can :read, [JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family]
        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, EmployeeLeavRequest, employee_id: user.employee_id
        can :read, AdvanceSalary, employee_id: user.employee_id
        can :read, Attendance, employee_id: user.employee_id
        can :manage, GoalBunch, employee_id: user.employee_id
        can :manage, OnDutyRequest, employee_id: user.employee_id
        can :manage, GoalRating, appraisee_id: user.employee_id
        can :manage, TravelRequest, employee_id: user.employee_id
        can [:read, :create, :update], DailyBillDetail, travel_request_id: user.employee_id
      elsif user.role.name == 'AccountAdmin'
        can :read, Employee
        can :manage, EmployeeLeavRequest
        can :manage, [AdvanceSalary, Instalment]
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
      elsif user.role.name == 'Account'
        can :read, Employee
        can :manage, EmployeeLeavRequest
        can :manage, AdvanceSalary
      end
    end
  end
end
