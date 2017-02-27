class CareerApplicationsController < ApplicationController
  layout :layout

  def index
    @job_categories = JobCategory.all
  end

  def new
    @new_application = CareerApplication.new
  end

  def create
    @job_posting = JobPosting.find(params[:job_posting_id])
    @new_application = @job_posting.career_applications.new(career_application_params)
    if @new_application.save
      redirect_to root_path
      flash[:success] = 'Your application has been submitted.'
      # AppMailer.notify_on_new_application(@new_application).deliver
    else
      render :new
      flash[:danger] = 'All fields required.'
    end
  end

  private

  def career_application_params
    params.require(:career_application).permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        :cover_letter,
        :resume,
        :job_posting_id
      )
  end

  def layout
    'career_applications'
  end

end