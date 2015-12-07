module Admin
  class CareerApplicationsController < AdminsController

    def index
      @applications = CareerApplication.all
    end

    def show
      @application = CareerApplication.find(params[:id])
    end

    def destroy
      @application = CareerApplication.find(params[:id])
      @application.destroy
      redirect_to admin_career_applications_path
    end

  end
end