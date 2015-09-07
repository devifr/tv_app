class Backend::ImagesController < Backend::ApplicationController

  def index
    @images = Image.page(params[:page]).per(params[:per_page])
  end

  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    if image.save
      flash[:success] = 'Image Was Successfully Saved'
      redirect_to backend_images_path
    else
      flash[:error] = image.errors.full_message
      redirect_to backend_images_path
    end
  end

  def edit
    image
  end

  def update
    if image.update_attributes(image_params)
      flash[:success] = 'Image Was Successfully Updated'
      redirect_to backend_images_path
    else
      flash[:error] = image.errors.full_message
      redirect_to backend_images_path
    end
  end

  def destroy
    if image.delete
      flash[:success] = 'Image Was Successfully Deleted'
      redirect_to backend_images_path
    else
      flash[:error] = image.errors.full_message
      redirect_to backend_images_path
    end
  end

  private
    def image_params
      params.require(:image).permit(:thumbnail)
    end

    def image
      @image ||= Image.find(params[:id])

  end
end