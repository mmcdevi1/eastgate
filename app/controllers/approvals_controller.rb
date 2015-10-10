class ApprovalsController < HatchesController
  before_action :correct_client
  before_action :set_approvals, only: [:edit, :update, :destroy, :show]
  before_action :correct_asset, only: :show

  layout :approval_layout, only: [:index, :show, :approved]

  def index
    @approvals = @asset.approvals.not_approved
    @approved = @asset.approvals.approved
  end

  def show
    @approvals = @asset.approvals.not_approved
  end

  def update
    @approval.user_id = current_user.id
    if @approval.update(approvals_params)
      flash[:success] = 'Approved successfull!'
      redirect_to asset_approvals_path
    else
      render 'index'
    end
  end

  def approved
    @approvals = @asset.approvals.not_approved
    @approved = @asset.approvals.approved
  end

  private

  def set_approvals
    @approval = Approval.find(params[:id])
  end

  def approvals_params
    params.require(:approval).permit(
      :title,
      :user_id,
      :priority_id,
      :asset_id,
      :approved
      )
  end

  def approval_layout
    'approval'
  end

  def correct_asset
    @approval = Approval.find(params[:id])
    if @approval.asset_id != @asset.id
      redirect_to asset_approvals_path
    end
  end
end