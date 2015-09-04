class Backend::ProgramsController < Backend::ApplicationController

  def index
    @programs = Program.page(params[:page]).per(params[:per_page])
  end

  def new
    set_options
    @program = Program.new
  end

  def create
    set_options
    program = Program.new(program_params)
    if program.save
      flash[:success] = 'Program Was Successfully Saved'
      redirect_to backend_programs_path
    else
      flash[:error] = program.errors.full_message
      redirect_to backend_programs_path
    end
  end

  def edit
    set_options
    program
  end

  def show
    program
  end

  def update
    set_options
    if program.update_attributes(program_params)
      flash[:success] = 'Program Was Successfully Updated'
      redirect_to backend_programs_path
    else
      flash[:error] = program.errors.full_message
      redirect_to backend_programs_path
    end
  end

  def destroy
    if program.delete
      flash[:success] = 'Program Was Successfully Deleted'
      redirect_to backend_programs_path
    else
      flash[:error] = program.errors.full_message
      redirect_to backend_programs_path
    end
  end

  private
    def program_params
      params.require(:program).permit(:code, :name, :thumbnail, :channel_id, :category_id, :is_episode)
    end

    def set_options
      @channels = Channel.all
      @categories = Category.all
    end

    def program
      @program ||= Program.find(params[:id])

  end
end