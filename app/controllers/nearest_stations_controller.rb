class NearestStationsController < ApplicationController
  before_action :set_nearest_station, only: %i[ show edit update destroy ]

  # GET /nearest_stations
  def index
    @nearest_stations = NearestStation.all
  end

  # GET /nearest_stations/1 
  def show
  end

  # GET /nearest_stations/new
  def new
    @nearest_station = NearestStation.new
  end

  # GET /nearest_stations/1/edit
  def edit
  end

  # POST /nearest_stations 
  def create
    @nearest_station = NearestStation.new(nearest_station_params)

      if @nearest_station.save
        redirect_to @nearest_station, notice: "Nearest station was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /nearest_stations/1 or /nearest_stations/1.json
  def update
      if @nearest_station.update(nearest_station_params)
        redirect_to @nearest_station, notice: "Nearest station was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /nearest_stations/1 or /nearest_stations/1.json
  def destroy
    @nearest_station.destroy
      redirect_to nearest_stations_url, notice: "Nearest station was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nearest_station
      @nearest_station = NearestStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nearest_station_params
      params.require(:nearest_station).permit(:line, :station, :on_foot, :property_id, :id)
    end
end
