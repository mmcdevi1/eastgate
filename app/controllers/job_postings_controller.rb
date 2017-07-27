class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show]

  def show
    if @job_posting
      if @job_posting.published == false
        redirect_to career_applications_path
        flash[:danger] = 'Record does not exist.'
      end
    end

    unless @job_posting
      redirect_to career_applications_path
      flash[:danger] = 'Record does not exist.'
    end
  end

  private
  def set_job_posting
    @job_posting = JobPosting.find_by_id(params[:id])
  end

end