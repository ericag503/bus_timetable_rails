class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find(params[:id])
    @stops = Stop.all
  end

  def create
    @station = Station.new(params_station)
    if @station.save
      flash[:notice] = "Station saved."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(params_station)
      flash[:notice] = "Station has been updated."
      redirect_to stations_path
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "Your station has been deleted"
    redirect_to stations_path
  end

  private
  def params_station
    params.require(:station).permit(:name, line_ids:[])
  end

end
