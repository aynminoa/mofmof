class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties 
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @nearest_stations = @property.nearest_stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    2.times { @property.nearest_stations.new }
  end

  # GET /properties/1/edit
  def edit
    @property.nearest_stations.new
  end

  # POST /properties 
  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to @property, notice: "物件登録が完了しました" 
      else
        render :new, status: :unprocessable_entity 
      end
    end

  # PATCH/PUT /properties/1 
  def update
      if @property.update(property_params)
        redirect_to @property, notice: "物件情報を更新しました" 
      else
        render :edit, status: :unprocessable_entity 
      end
    end

  # DELETE /properties/1 
  def destroy
    @property.destroy
      redirect_to properties_url, notice: "物件情報を削除しました" 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :rent, :address, :age, :remark, 
                                      nearest_stations_attributes: [:line, :station, :on_foot, :id])
    end
end
