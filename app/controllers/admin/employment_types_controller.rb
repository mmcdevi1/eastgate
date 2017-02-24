module Admin
  class EmploymentTypesController < AdminsController
    before_action :set_job_category, only: [:show, :edit, :update, :destroy]

    def index
      @employment_types = EmploymentType.all
    end

    def show
    end

    def edit
    end

    def new
      @employment_type = EmploymentType.new
    end

    def create
      @employment_type = EmploymentType.new(employment_type_params)
      if @employment_type.save
        redirect_to admin_employment_types_path
        flash[:success] = 'Team member created.'
      else
        render 'new'
      end
    end

    def update
      if @employment_type.update(employment_type_params)
        redirect_to admin_employment_types_path
        flash[:success] = 'Saved'
      else
        render 'edit'
      end
    end

    def destroy
      @employment_type.destroy
      flash[:success] = 'Deleted.'
      redirect_to :back
    end

    private
    def employment_type_params
      params.require(:employment_type).permit(:title)
    end

    def set_job_category
      @employment_type = EmploymentType.find(params[:id])
    end
  end
end