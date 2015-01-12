module UsersHelper
  def user_equal_id(id)
    return false unless user_signed_in?
    current_user.id == id
  end
end
