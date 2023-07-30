class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :user

    can :manage, :all if user.role == 'admin'

    return unless user.role == 'user'

    can :create, Post
    can :create, Comment
    can :destroy, Comment
    can :destroy, Post
  end
end
