# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Complaint
    can :read, User
    return unless user

    can :manage, Complaint, user_id: user.id
    can :manage, User, id: user.id
  end
end
