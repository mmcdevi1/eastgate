module Admin
  class TimelinesController < AdminsController

    def index
      @timeline = Timeline.all
    end

    def new
      @timeline = Timeline.new
    end

    def create
      @timeline = Timeline.new(timeline_params)
      if @timeline.save
        flash[:success] = "Timeline saved."
        redirect_to admin_timelines_path
      else
        render 'new'
      end
    end

    private

    def timeline_params
      params.require(:timeline).permit(:asset_id, :timeline_doc)
    end

  end
end