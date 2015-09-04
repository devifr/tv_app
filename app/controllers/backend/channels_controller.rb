class Backend::ChannelsController < Backend::ApplicationController

  def index
    @channels = Channel.page(params[:page]).per(params[:per_page])
  end

  def new
    @channel = Channel.new
  end

  def create
    channel = Channel.new(channel_params)
    if channel.save
      flash[:success] = 'Channel Was Successfully Saved'
      redirect_to backend_channels_path
    else
      flash[:error] = channel.errors.full_message
      redirect_to backend_channels_path
    end
  end

  def edit
    channel
  end

  def update
    if channel.update_attributes(channel_params)
      flash[:success] = 'Channel Was Successfully Updated'
      redirect_to backend_channels_path
    else
      flash[:error] = channel.errors.full_message
      redirect_to backend_channels_path
    end
  end

  def show
    channel
  end

  def destroy
    if channel.delete
      flash[:success] = 'Channel Was Successfully Deleted'
      redirect_to backend_channels_path
    else
      flash[:error] = channel.errors.full_message
      redirect_to backend_channels_path
    end
  end

  private
    def channel_params
      params.require(:channel).permit(:code, :name, :thumbnail, :description)
    end

    def channel
      @channel ||= Channel.find(params[:id])
    end
end