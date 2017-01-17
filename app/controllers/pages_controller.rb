class PagesController < ApplicationController
  layout "landing_page"

  def show
    page = params[:page]
    render "pages/#{page}"
  end

end
