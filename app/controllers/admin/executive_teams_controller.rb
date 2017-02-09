module Admin
  class ExecutiveTeamsController < AdminsController
    before_action :set_executive_member, only: [:show, :edit, :update, :destroy]

    def index
      @executive_teams = ExecutiveTeam.is_member.all
    end

    def show
    end

    def edit
    end

    def new
      @executive_team = ExecutiveTeam.new
    end

    def create
      @executive_team = ExecutiveTeam.new(executive_team_params)
      if @executive_team.save
        redirect_to :back
        flash[:success] = 'Team member created.'
      else
        render 'new'
      end
    end

    def update
      if @executive_team.update(executive_team_params)
        redirect_to admin_asset_folders_path
        flash[:success] = 'Rename Successful.'
      else
        render 'edit'
      end
    end

    def destroy
      @executive_team.destroy
      flash[:success] = 'Deleted.'
      redirect_to :back
    end

    private
    def executive_team_params
      params.require(:executive_team).permit(:first_name, :last_name, :title, :content, :is_member)
    end

    def set_executive_member
      @executive_team = ExecutiveTeam.find(params[:id])
    end
  end
end
















