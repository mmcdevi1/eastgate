class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show]

  def show
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