class Ability
  include CanCan::Ability

  def initialize(user)
      #user ||= { User.new } # guest user (not logged in)
    if user.nil?
      user = User.new
      user.add_role :not_logged
    end
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :worker
        can :read, :all

        can [:create, :edit], Order
      elsif user.has_role? :not_logged
        can :read, Waffle
        can :create, User
      else                # zalogowany bez roli
        can :create, Order
        can :read, [Waffle, Shop, user]

      end
  end

end