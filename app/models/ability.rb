class Ability
  include CanCan::Ability

  def initialize(user) 
  
    if user.is_admin?
      can :manage, :all
    
    elsif user.is_evaluator?
      can :read, :all
      can :create, :all
      can :update, :all
      cannot :update, Group
      cannot :create, Group
      cannot :delete, Scale


    else user.is_normal_user?
      can :create,Test, evaluated_id: user.id
      can :read, Test, evaluated_id: user.id
      cannot :index, Test

      can :read, User, id: user.id
      cannot :index, User

      cannot :read, Group, evaluated_id: user.id 
    end
  end
end
    