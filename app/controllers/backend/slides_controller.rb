class Backend::SlidesController < Backend::ApplicationController

  def index
    @slides = Slide.page(params[:page]).per(params[:per_page])
  end

  def destroy
    slide = Slide.find(params[:id])
    if slide.delete
      flash[:success] = 'Slide Was Successfully Deleted'
      redirect_to backend_slides_path
    else
      flash[:error] = slide.errors.full_message
      redirect_to backend_slides_path
    end
  end

  def add_image_to_slide
    image = Image.find(params[:id])
    slide = Slide.new(imageable: image)
    if slide.save
      flash[:success] = 'Slide Was Successfully Created'
      redirect_to :back
    else
      flash[:error] = slide.errors.full_message
      redirect_to :back
    end
  end

  def add_video_to_slide
    image = Video.find(params[:id])
    slide = Slide.new(imageable: image)
    if slide.save
      flash[:success] = 'Slide Was Successfully Created'
      redirect_to :back
    else
      flash[:error] = slide.errors.full_message
      redirect_to :back
    end
  end

end