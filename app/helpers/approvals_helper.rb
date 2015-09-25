module ApprovalsHelper

  def priority_colors(approval)
    if approval.priority_id == 1
      'text-danger'
    elsif approval.priority_id == 2
      'text-warning-dker'
    elsif approval.priority_id == 3
      'text-success'
    end
  end

  def priority_title_for_form(approval)
    if params[:action] == 'edit'
      Priority.where(id: approval.priority_id).first.title
    elsif params[:action] == 'new'
      'Priority Level'
    end
  end

  def asset_name_for_form(approval)
    if params[:action] == 'edit'
      approval.asset.name
    elsif params[:action] == 'new'
      'Select Asset'
    end
  end

end
