class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.worker?
        can :read, :all
        can :create, Order
      else
        can :create, Order
        can :read, Waffle
        can :read, Shop
      end
  end
end