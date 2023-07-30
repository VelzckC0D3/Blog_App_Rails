class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :user

    if user.role == 'admin'
      can :manage, :all
    end

    if user.role == 'user'
    can :read, :all
    can :create, Post
    can :create, Comment
    can :destroy, Comment
    can :destroy, Post
    end
  end
end
