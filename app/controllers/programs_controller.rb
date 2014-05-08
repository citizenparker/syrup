class ProgramsController < ApplicationController
  def index
    @programs = Program.all.order(:created_at => :desc)
  end

  def show
    @program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @program.update_attributes!(_program_params)

    redirect_to program_path(@program)
  end

  def _program_params
    params[:program].permit(:name, :capacity)
  end
end
