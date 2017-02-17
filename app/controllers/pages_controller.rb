class PagesController < ApplicationController
  layout "landing_page"

  def show
    @user = User.new
    page = params[:page]
    render "pages/#{page}"
  end

end
