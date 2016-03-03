module UsersHelper
  def users_index_title
    params[:action] == 'index' ? 'Contacts' : 'Admins'
  end
end