class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

  def new
    @stop = Stop.new
  end

  def show
    @stops = Stop.all
    @line = Line.new
    @station = Station.new
    @stop = Stop.find(params[:id])
  end

  def edit
    @lines = Line.all
    @stations = Station.all
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update(params_stops)
      flash[:notice] = "Your stop has been updated fool"
      redirect_to stops_path(@stop)
    else
      render 'show'
    end
  end


  def create
    @stop = Stop.new(params_stops)
    if @stop.save
      flash[:notice] = "Stop saved!!"
      redirect_to stops_path
    else
      render 'new'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:notice] = "Your stop has been deleted"
    redirect_to stops_path
  end


private
  def params_stops
    params.require(:stop).permit(:station_id, :line_id, :name)
  end
end




# <%= f.collection_check_boxes :category_ids, Category.all, :id, :name %>





