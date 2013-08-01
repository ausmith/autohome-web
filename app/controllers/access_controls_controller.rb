class AccessControlsController < ApplicationController
  # GET /users/access_controls
  # GET /users/access_controls.json
  def index
    @access_controls = AccessControl.where(:user_id => params[:user_id])
    @user = User.find_by_id(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/access_controls/1
  # GET /users/access_controls/1.json
  def show
    @access_control = AccessControl.where(:id => params[:id], :user_id => params[:user_id]).first
    @user = User.find_by_id(params[:user_id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/access_controls/new
  # GET /users/access_controls/new.json
  def new
    @access_control = AccessControl.new
    @user = User.find_by_id(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/access_controls/1/edit
  def edit
    @access_control = AccessControl.where(:id => params[:id], :user_id => params[:user_id]).first
    @user = User.find_by_id(params[:user_id])
  end

  # POST /users/access_controls
  # POST /users/access_controls.json
  def create
    @access_control = AccessControl.new(params[:access_control])
    @access_control.user_id = params[:user_id]

    respond_to do |format|
      if @access_control.save
        format.html { redirect_to [@access_control.user, @access_control], notice: 'Access control was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/access_controls/1
  # PUT /users/access_controls/1.json
  def update
    @access_control = AccessControl.where(:id => params[:id], :user_id => params[:user_id]).first

    respond_to do |format|
      if @access_control.update_attributes(params[:access_control])
        format.html { redirect_to [:user, @access_control], notice: 'Access control was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/access_controls/1
  # DELETE /users/access_controls/1.json
  def destroy
    @access_control = AccessControl.where(:id => params[:id], :user_id => params[:user_id]).first
    @access_control.destroy

    respond_to do |format|
      format.html { redirect_to user_access_controls_url }
    end
  end
end
