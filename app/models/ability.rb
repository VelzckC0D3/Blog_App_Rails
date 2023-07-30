class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, :user
    can :manage, :all if user.role == 'admin'
    return unless user.role == 'user'
    
    can :read, :all
    can :create, Post, author_id: user.id
    can :create, Comment, author_id: user.id
    can :destroy, Comment, author_id: user.id
    can :destroy, Post, author_id: user.id
  end
end
