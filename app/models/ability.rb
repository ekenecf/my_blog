class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # support guest user ie users not logged in
    can :read, Post, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :read, User # all users can view users
    can :manage, Post, user: user # only post owners can manage posts
    can :manage, Comment, user: user # only post owners can manage posts
    return unless user.admin? # additional permissions for administrators

    can :manage, :all
  end
end
