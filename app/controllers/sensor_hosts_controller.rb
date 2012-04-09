class SensorHostsController < ApplicationController
  # GET /sensor_hosts
  # GET /sensor_hosts.json
  def index
    @sensor_hosts = SensorHost.all
    
    test = Sensors::TemperatureSensor.new(1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sensor_hosts }
    end
  end

  # GET /sensor_hosts/1
  # GET /sensor_hosts/1.json
  def show
    @sensor_host = SensorHost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sensor_host }
    end
  end

  # GET /sensor_hosts/new
  # GET /sensor_hosts/new.json
  def new
    @sensor_host = SensorHost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sensor_host }
    end
  end

  # GET /sensor_hosts/1/edit
  def edit
    @sensor_host = SensorHost.find(params[:id])
  end

  # POST /sensor_hosts
  # POST /sensor_hosts.json
  def create
    @sensor_host = SensorHost.new(params[:sensor_host])

    respond_to do |format|
      if @sensor_host.save
        format.html { redirect_to @sensor_host, :notice => 'Sensor host was successfully created.' }
        format.json { render :json => @sensor_host, :status => :created, :location => @sensor_host }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sensor_host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sensor_hosts/1
  # PUT /sensor_hosts/1.json
  def update
    @sensor_host = SensorHost.find(params[:id])

    respond_to do |format|
      if @sensor_host.update_attributes(params[:sensor_host])
        format.html { redirect_to @sensor_host, :notice => 'Sensor host was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sensor_host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sensor_hosts/1
  # DELETE /sensor_hosts/1.json
  def destroy
    @sensor_host = SensorHost.find(params[:id])
    @sensor_host.destroy

    respond_to do |format|
      format.html { redirect_to sensor_hosts_url }
      format.json { head :ok }
    end
  end
end
