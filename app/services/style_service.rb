class StyleService < BaseService

  def all_styles
    parse(connection.get("/v2/styles", api_key))
  end

  def find_style(id)
    parse(connection.get("/v2/style/#{id}", api_key))
  end

  def find_beers_for_style(id, page = 1)
    parse(connection.get("/v2/beers", style_params(id, page)))
  end

  private
    def api_key
      {
        key: ENV["BREWERYAPIKEY"],
      }
    end

    def style_params(id, page)
      {
        key: ENV["BREWERYAPIKEY"],
        styleId: id,
        p: page
      }
    end
end
