

class MainController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
        Film,
        params[:filterrific]
    ) or return
    @films = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
end

