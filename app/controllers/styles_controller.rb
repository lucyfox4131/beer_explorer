class StylesController < ApplicationController
  def index
    @styles = Style.get_all
  end

  def show
    @style = Style.find_style(params['id'])
    @beers = @style.beers(params["page"])
  end
end
