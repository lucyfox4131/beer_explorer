class StylesController < ApplicationController
  def index
    @styles = Style.get_all
  end

  def show
    style_id = params['id']
  end
end
