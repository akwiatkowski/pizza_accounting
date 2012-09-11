class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, User
    else
      can :read, User, id: user.id
      can :manage, Group, owner_id: user.id
      cannot :destroy, Group
    end
  end
end
