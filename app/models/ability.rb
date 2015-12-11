class Ability
  include CanCan::Ability

  def initialize(user)
    if user.class == Group
      can [:read, :create, :update, :destroy], [CompanyLeav] 
      can :manage, :all
      #can [:read, :create, :update, :destroy], [Company] 
    elsif user.class == Member
      #can [:read, :create, :update], [MachineProduct], :buyer_id => user.id
      if user.role.name == 'Company'
        can [:read, :create, :update, :destroy], [CompanyLocation,Department,Employee] 
      elsif user.role.name == 'CompanyLocation'
        can [:read, :create, :update, :destroy], [Department,Employee]

      elsif user.role.name == 'Department'
        can [:read, :create, :update, :destroy], [Employee] 
        can [:read, :create, :update, :destroy], [EmployeeLeavRequest]
      elsif user.role.name == 'Employee'
        can [:read, :create, :update, :destroy], [EmployeeLeavRequest,CompanyLeav,Award,Family,Qualification,Skillset,Experince,LeavCancelled], :employee_id => user.id 
      end
    end 

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
