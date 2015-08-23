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

end
