class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, User
    else
      can :read, User, id: user.id
    end
  end
end
