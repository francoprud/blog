class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def edit?
    @record == @user
  end

  def delete?
    edit?
  end
end
