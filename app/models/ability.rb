class Ability
  include CanCan::Ability

  def initialize(user)
    # Create guest user aka. anonymous (not logged-in) when user is nil.
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    else
      # logged in user
      if user.has_role? :user
        can :manage, Jim, :user_id => user.id
        can :read, Mike, :user_id => user.id
        can :read, Leo, :user_id => user.id
      
        cannot :manage, Mike, :user_id => user.id 
        cannot :manage, Leo, :user_id => user.id 
      end
    end
  end
end
