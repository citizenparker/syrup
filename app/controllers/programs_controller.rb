class ProgramsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Programs", :programs_path

  def index
    @programs = Program.all.order(:created_at => :desc)
  end

  def new
    @program = Program.new
  end

  def show
    @program = Program.find(params[:id])
    add_breadcrumb @program.name, program_path(@program)
  end

  def edit
    @program = Program.find(params[:id])
    add_breadcrumb @program.name, program_path(@program)
  end

  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(_program_params)
      redirect_to program_path(@program)
    else
      add_breadcrumb @program.name, program_path(@program)
      render :edit
    end
  end

  def create
    @program = Program.create(_program_params)
    if @program.persisted?
      redirect_to program_path(@program)
    else
      render :new
    end
  end

  def _program_params
    params[:program].permit(:name, :maximum_participants, :minimum_age, :maximum_age)
  end
end
