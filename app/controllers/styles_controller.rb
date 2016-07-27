class StylesController < ApplicationController
  def index
    @styles = Style.get_all
  end
end
