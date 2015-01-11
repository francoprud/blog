module UsersHelper
  def user_equal_id(id)
    if user_signed_in?
      current_user.id == id
    end
  end
end
