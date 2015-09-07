class Backend::VideosController < Backend::ApplicationController

  def index
    @videos = Video.page(params[:page]).per(params[:per_page])
  end

  def new
    set_options
    @video = Video.new
  end

  def create
    set_options
    video = Video.new(video_params)
    if video.save
      flash[:success] = 'Video Was Successfully Saved'
      redirect_to backend_videos_path
    else
      flash[:error] = video.errors.full_message
      redirect_to backend_videos_path
    end
  end

  def edit
    set_options
    video
  end

  def update
    set_options
    if video.update_attributes(video_params)
      flash[:success] = 'Video Was Successfully Updated'
      redirect_to backend_videos_path
    else
      flash[:error] = video.errors.full_message
      redirect_to backend_videos_path
    end
  end

  def show
    video
  end

  def destroy
    if video.delete
      flash[:success] = 'Video Was Successfully Deleted'
      redirect_to backend_videos_path
    else
      flash[:error] = video.errors.full_message
      redirect_to backend_videos_path
    end
  end

  private
    def set_options
      @programs = Program.all
    end

    def video_params
      params.require(:video).permit(:program_id, :title, :season, :episode, :media_id, :thumbnail, :description, :featured)
    end

    def video
      @video ||= Video.find(params[:id])
    end
end