class ApprovalsController < HatchesController
  before_action :correct_client

  def index
    @approvals = @asset.approvals.not_approved
    @approved = @asset.approvals.approved
  end

end
