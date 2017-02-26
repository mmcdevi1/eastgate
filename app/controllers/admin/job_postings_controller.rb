module Admin
  class JobPostingsController < AdminsController
    before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

    def index
      @job_postings = JobPosting.all
    end

    def show
    end

    def edit
    end

    def new
      @job_posting = JobPosting.new
    end

    def create
      @job_posting = JobPosting.new(job_posting_params)
      if @job_posting.save
        redirect_to admin_job_postings_path
        flash[:success] = 'Team member created.'
      else
        render 'new'
      end
    end

    def update
      if @job_posting.update(job_posting_params)
        redirect_to admin_job_postings_path
        flash[:success] = 'Saved'
      else
        render 'edit'
      end
    end

    def destroy
      @job_posting.destroy
      flash[:success] = 'Deleted.'
      redirect_to :back
    end

    private
    def job_posting_params
      params.require(:job_posting).permit(:title, :location, :description, :job_category_id)
    end

    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end
  end
end