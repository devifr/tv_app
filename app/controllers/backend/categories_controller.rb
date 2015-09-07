class Backend::CategoriesController < Backend::ApplicationController

  def index
    @categories = Category.page(params[:page]).per(params[:per_page])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:success] = 'Category Was Successfully Saved'
      redirect_to backend_categories_path
    else
      flash[:error] = category.errors.full_message
      redirect_to backend_categories_path
    end
  end

  def edit
    category
  end

  def update
    if category.update_attributes(category_params)
      flash[:success] = 'Category Was Successfully Updated'
      redirect_to backend_categories_path
    else
      flash[:error] = category.errors.full_message
      redirect_to backend_categories_path
    end
  end

  def show
    category
  end

  def destroy
    if category.delete
      flash[:success] = 'Category Was Successfully Deleted'
      redirect_to backend_categories_path
    else
      flash[:error] = category.errors.full_message
      redirect_to backend_categories_path
    end
  end

  private
    def category_params
      params.require(:category).permit(:code, :name, :thumbnail)
    end

    def category
      @category ||= Category.find(params[:id])

  end
end