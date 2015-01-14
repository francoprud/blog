class UserPolicy < ApplicationPolicy
  def create
    @user
  end
end
