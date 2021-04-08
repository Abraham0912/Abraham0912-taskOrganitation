# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Task, participating_users: { user_id: user.id }
  end
end
