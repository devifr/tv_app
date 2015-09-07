class Backend::SchedulesController < Backend::ApplicationController

  def index
    @schedules = Schedule.page(params[:page]).per(params[:per_page])
  end

  def new
    set_options
    @schedule = Schedule.new
  end

  def create
    set_options
    schedule = Schedule.new(schedule_params)
    if schedule.save
      flash[:success] = 'Schedule Was Successfully Saved'
      redirect_to backend_schedules_path
    else
      flash[:error] = schedule.errors.full_message
      redirect_to backend_schedules_path
    end
  end

  def edit
    set_options
    schedule
  end

  def update
    set_options
    if schedule.update_attributes(schedule_params)
      flash[:success] = 'Schedule Was Successfully Updated'
      redirect_to backend_schedules_path
    else
      flash[:error] = schedule.errors.full_message
      redirect_to backend_schedules_path
    end
  end

  def destroy
    if schedule.delete
      flash[:success] = 'Schedule Was Successfully Deleted'
      redirect_to backend_schedules_path
    else
      flash[:error] = schedule.errors.full_message
      redirect_to backend_schedules_path
    end
  end

  private
    def set_options
      @channels = Channel.all
    end

    def schedule_params
      params.require(:schedule).permit(:title, :start_at, :channel_id)
    end

    def schedule
      @schedule ||= Schedule.find(params[:id])

  end
end