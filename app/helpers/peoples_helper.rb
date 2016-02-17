module PeoplesHelper
  def company_name_for_form(user)
    if params[:action] == 'edit'
      user.client.name
    elsif params[:action] == 'new'
      'Select Company'
    end
  end
end