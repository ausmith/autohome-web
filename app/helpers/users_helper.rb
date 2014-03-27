module UsersHelper
  def get_user_link(user)
    user ? link_to(user.display_full_name, user) : '-'
  end
end
