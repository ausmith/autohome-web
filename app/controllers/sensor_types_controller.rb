class SensorTypesController < ApplicationController
  # GET /sensor_types
  # GET /sensor_types.json
  def index
    @sensor_types = SensorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sensor_types }
    end
  end

  # GET /sensor_types/1
  # GET /sensor_types/1.json
  def show
    @sensor_type = SensorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sensor_type }
    end
  end

  # GET /sensor_types/new
  # GET /sensor_types/new.json
  def new
    @sensor_type = SensorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sensor_type }
    end
  end

  # GET /sensor_types/1/edit
  def edit
    @sensor_type = SensorType.find(params[:id])
  end

  # POST /sensor_types
  # POST /sensor_types.json
  def create
    @sensor_type = SensorType.new(params[:sensor_type])

    respond_to do |format|
      if @sensor_type.save
        format.html { redirect_to @sensor_type, notice: 'Sensor type was successfully created.' }
        format.json { render json: @sensor_type, status: :created, location: @sensor_type }
      else
        format.html { render action: "new" }
        format.json { render json: @sensor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sensor_types/1
  # PUT /sensor_types/1.json
  def update
    @sensor_type = SensorType.find(params[:id])

    respond_to do |format|
      if @sensor_type.update_attributes(params[:sensor_type])
        format.html { redirect_to @sensor_type, notice: 'Sensor type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sensor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_types/1
  # DELETE /sensor_types/1.json
  def destroy
    @sensor_type = SensorType.find(params[:id])
    @sensor_type.destroy

    respond_to do |format|
      format.html { redirect_to sensor_types_url }
      format.json { head :no_content }
    end
  end
end
