class ApprovalsController < HatchesController

  def index
    @approvals = @asset.approvals.not_approved
    @approved = @asset.approvals.approved
  end

end
