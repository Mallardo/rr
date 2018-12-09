class VisitorsController < ApplicationController

  def index
    respond_to do |format|
      format.html {redirect_to teams_url}
    end
  end
end
