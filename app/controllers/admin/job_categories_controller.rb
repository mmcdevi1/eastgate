module Admin
  class JobCategoriesController < AdminsController
    before_action :set_job_category, only: [:show, :edit, :update, :destroy]

    def index
      @job_categories = JobCategory.all
    end

    def show
    end

    def edit
    end

    def new
      @job_category = JobCategory.new
    end

    def create
      @job_category = JobCategory.new(job_category_params)
      if @job_category.save
        redirect_to admin_job_categories_edit_path(@job_category)
        flash[:success] = 'Team member created.'
      else
        render 'new'
      end
    end

    def update
      if @job_category.update(job_category_params)
        redirect_to admin_job_categories_edit_path(@job_category)
        flash[:success] = 'Saved'
      else
        render 'edit'
      end
    end

    def destroy
      @job_category.destroy
      flash[:success] = 'Deleted.'
      redirect_to :back
    end

    private
    def job_category_params
      params.require(:job_category).permit(:title)
    end

    def set_job_category
      @job_category = JobCategory.find(params[:id])
    end
  end
end