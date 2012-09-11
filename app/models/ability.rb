class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, User, id: user.id
      can :read, user.owned_group.users
      can :manage, Group, owner_id: user.id
      can :manage, Transaction, group: user.owned_group
      cannot :destroy, Group
    end
  end
end
