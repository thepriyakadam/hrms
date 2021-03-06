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
      elsif user.role.name == 'Branch'|| user.role.name == "TimeAndAttendance" || user.role.name == 'Costomize'
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
        can :manage, Employee
        cannot [:destroy,:update,:create],Employee
        can :manage, [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument], employee_id: user.employee_id
        cannot [:destroy,:update,:create], [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument]
        
        # can :read, [JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family]
        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, [EmployeeLeavRequest, ParticularLeaveRecord]
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
        can :manage, [OnDutyRequest, ParticularOdRecord]
      elsif user.role.name == 'Supervisor'
        can :manage, Employee
        cannot [:destroy,:update,:create],Employee
        can :manage, [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument], employee_id: user.employee_id
        cannot [:destroy,:update,:create], [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument]
        
        # can :read, Employee
        # can :manage, [Employee, JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family,Award,Certification]

        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, EmployeeLeavRequest
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
        can :manage, [OnDutyRequest, ParticularOdRecord]
      elsif user.role.name == 'CEO'
        can :read, Employee
        can :manage, [Employee, JoiningDetail, EmployeeBankDetail, Qualification, Experience, Skillset, EmployeePhysical, Family,Award,Certification]

        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, EmployeeLeavRequest
        can :manage, [GoalBunch, GoalRating]
        can :manage, [TravelRequest, DailyBillDetail]
        can :manage, [OnDutyRequest, ParticularOdRecord]
      elsif user.role.name == 'Employee'

        can :manage, Employee, id: user.employee_id
        # can :read, JoiningDetail, employee_id: user.employee_id
        cannot [:destroy,:update,:create],Employee
         can :manage, [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument], employee_id: user.employee_id
        cannot [:destroy,:update,:create], [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument]
        can :read, [EmployeeTemplate, EmployeeSalaryTemplate]
        can :manage, EmployeeLeavRequest, employee_id: user.employee_id
        can :read, AdvanceSalary, employee_id: user.employee_id
        can :read, Attendance, employee_id: user.employee_id
        can :manage, GoalBunch, employee_id: user.employee_id
        can :manage, OnDutyRequest, employee_id: user.employee_id
        can :manage, GoalRating, appraisee_id: user.employee_id
        can :manage, TravelRequest, employee_id: user.employee_id
        can [:read, :create, :update], DailyBillDetail, travel_request_id: user.employee_id
      elsif user.role.name == 'NewEmployee'
        can :manage, Employee, id: user.employee_id
        can :manage, [JoiningDetail, Qualification, Experience, Skillset, EmployeePhysical, Certification,Family,Award,AssignedAsset,EmployeeDocument], employee_id: user.employee_id
        can :manage,EmployeeBankDetail, employee_id: user.employee_id
        # cannot [:destroy,:update,:create],JoiningDetail
        cannot [:destroy,:update,:create],EmployeeBankDetail
        # cannot [:destroy,:update,:create],EmployeeDocument
        cannot [:destroy,:update,:create],EmployeeJcList
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
