class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :user

    can :manage, :all if user.role == 'admin'

    return unless user.role == 'user'

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
  end
end
