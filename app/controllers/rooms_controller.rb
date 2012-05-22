class RoomsController < ApplicationController
  attr_accessor :title, :description

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by_id(params[:id])

    unless @room
      render_404("STATIC_Sorry, we were unable to find that room.")
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, :notice => 'STATIC_Room was successfully created' }
      else
        format.html { render :action => "new" }
      end
    end
  end
  def edit
    @room = Room.find_by_id(params[:id])

    unless @room
      render_404("STATIC_Sorry, we were unable to find that room.")
    end
  end

  def update
    @room = Room.find_by_id(params[:id])

    if @room
      # Found the room, now update it!
      if @room.update_attributes(params[:room])
        # Success!
        redirect_to @room, :notice => "STATIC_Room has been updated."
      else
        #Failure!
        flash[:error] = "STATIC_Room has not been updated."
        render :action => "edit"
      end

    else
      render_404("STATIC_Sorry, we were unable to find that room.")
    end
  end

  def destroy
  end

  private

  def render_404 ( msg = nil )
    @error = msg if msg

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/app/views/errors/404.html.erb", :status => :not_found }
    end
  end

end
