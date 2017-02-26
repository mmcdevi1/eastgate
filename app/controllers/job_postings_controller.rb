class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show]

  def show
  end

  private
  def set_job_posting
    @job_posting = JobPosting.find(params[:id])
  end

end