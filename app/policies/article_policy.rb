class ArticlePolicy < ApplicationPolicy
  def new?
    @user.present?
  end

  def create?
    new?
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    @user && @record.user_id == @user.id
  end

  def update?
    @user && @record.user_id == @user.id
  end

  def destroy?
    @user && @record.user_id == @user.id
  end

  def send_last_ten?
    @user.present?
  end
end
