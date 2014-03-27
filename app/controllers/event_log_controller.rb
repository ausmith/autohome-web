class EventLogController < ApplicationController
  before_filter :administrator_only_access
  def index
    @events = SecEvent.available.recent.page(params[:page] || 1)
  end
end
