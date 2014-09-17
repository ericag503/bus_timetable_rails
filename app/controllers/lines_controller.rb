class LinesController < ApplicationController

  def index
    @line = Line.new
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(params_line)
    if @line.save
      flash[:notice] = "Line saved!!"
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def show
    @station = Station.new
    @stops = Stop.all
    @line = Line.find(params[:id])
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(params_line)
      flash[:notice] = "Line has been updated."
      redirect_to lines_path
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "The line has been deleted"
    redirect_to lines_path
  end


private
  def params_line
    params.require(:line).permit(:name, station_ids:[])
  end
end

