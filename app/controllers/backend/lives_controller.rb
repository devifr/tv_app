class Backend::LivesController < Backend::ApplicationController

  def index
    @lives = Live.page(params[:page]).per(params[:per_page])
  end

  def new
    set_options
    @live = Live.new
  end

  def create
    set_options
    live = Live.new(live_params)
    if live.save
      flash[:success] = 'Live Was Successfully Saved'
      redirect_to backend_lives_path
    else
      flash[:error] = live.errors.full_message
      redirect_to backend_lives_path
    end
  end

  def edit
    set_options
    live
  end

  def show
    live
  end

  def update
    set_options
    if live.update_attributes(live_params)
      flash[:success] = 'Live Was Successfully Updated'
      redirect_to backend_lives_path
    else
      flash[:error] = live.errors.full_message
      redirect_to backend_lives_path
    end
  end

  def destroy
    if live.delete
      flash[:success] = 'Live Was Successfully Deleted'
      redirect_to backend_lives_path
    else
      flash[:error] = live.errors.full_message
      redirect_to backend_lives_path
    end
  end

  private
    def set_options
      @channels = Channel.all
    end

    def live_params
      params.require(:live).permit(:streaming_url, :channel_id)
    end

    def live
      @live ||= Live.find(params[:id])

  end
end