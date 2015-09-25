class Admin::ApprovalsController < AdminsController
  before_action :set_approval, only: [:show, :edit, :update, :destroy]

  def index
    @clients   = Client.all
    @approvals = Approval.all
  end

  def show
  end

  def edit
  end

  def new
    @approval = Approval.new
  end

  def update
    if @approval.update(approval_params)
      redirect_to admin_approvals_path
      flash[:success] = 'Asset Updated.'
    else
      render 'edit'
    end
  end

  def create
    @approval = Approval.new(approval_params)
    if @approval.save
      redirect_to admin_approvals_path
      flash[:success] = 'New Approval Created.'
    else
      render 'new'
    end
  end

  def destroy
    @approval.destroy
    redirect_to admin_approvals_path
    flash[:success] = 'Approval Deleted.'
  end

  private

  def set_approval
    @approval = Approval.find(params[:id])
  end

  def approval_params
    params.require(:approval).permit(
        :title,
        :priority_id,
        :asset_id,
        :approved
      )
  end
end