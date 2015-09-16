class ApprovalsController < HatchesController
  before_action :correct_client
  before_action :set_approvals, only: [:edit, :update, :destroy]

  def index
    @approvals = @asset.approvals.not_approved
    @approved = @asset.approvals.approved
    add_breadcrumb 'Approvals', ''
  end

  def update
    if @approval.update(approvals_params)
      flash[:success] = 'Approved successfull!'
      redirect_to asset_approvals_path
    else
      render 'index'
    end
  end

  private

  def set_approvals
    @approval = Approval.find(params[:id])
  end

  def approvals_params
    params.require(:approval).permit(:title, :priority_id, :asset_id, :approved)
  end
end