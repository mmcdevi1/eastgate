module Admin
  class MinimumExperiencesController < AdminsController
    before_action :set_minimum_experience, only: [:show, :edit, :update, :destroy]

    def index
      @minimum_experiences = MinimumExperience.all
    end

    def show
    end

    def edit
    end

    def new
      @minimum_experience = MinimumExperience.new
    end

    def create
      @minimum_experience = MinimumExperience.new(minimum_experience_params)
      if @minimum_experience.save
        redirect_to admin_minimum_experiences_path
        flash[:success] = 'Team member created.'
      else
        render 'new'
      end
    end

    def update
      if @minimum_experience.update(minimum_experience_params)
        redirect_to admin_minimum_experiences_path
        flash[:success] = 'Saved'
      else
        render 'edit'
      end
    end

    def destroy
      @minimum_experience.destroy
      flash[:success] = 'Deleted.'
      redirect_to :back
    end

    private
    def minimum_experience_params
      params.require(:minimum_experience).permit(:title)
    end

    def set_minimum_experience
      @minimum_experience = MinimumExperience.find(params[:id])
    end
  end
end