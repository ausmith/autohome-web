class RoomsController < ApplicationController
  include SecEventsHelper
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.available.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.available.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.available.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    Room.transaction do
      @room = Room.create(params[:room])
      create_audit(:ROOMCREATE, room_id: @room.id, user_id: current_user.id)
    end

    respond_to do |format|
      if @room.id != nil
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.available.find(params[:id])
    result = false

    Room.transaction do
      result = @room.update_attributes(params[:room])
      create_audit(:ROOMUPDATE, room_id: @room.id, user_id: current_user.id)
    end

    respond_to do |format|
      if result
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    Room.transaction do
      @room = Room.available.find(params[:id])
      @room.soft_delete
      create_audit(:ROOMDESTROY, room_id: @room.id, user_id: current_user.id)
    end

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end
end
