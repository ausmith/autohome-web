class UsersController < ApplicationController
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find_by_id(params[:id])

    if @user
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @users }
      end
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
