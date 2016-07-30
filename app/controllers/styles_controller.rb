class StylesController < ApplicationController
  def index
    @styles = Style.get_all

  end

  def show
    @style = Style.find_style(params['id'])
    # @beers = Style.get_beers(params['id'])
  end
end
