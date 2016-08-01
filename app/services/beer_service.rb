class BeerService

  def initialize
    @_connection = Faraday.new("http://api.brewerydb.com")
  end

  def beer_by_name(name)
    parse(connection.get("/v2/beers", name_params(name)))
  end

  def brewery_by_name(name)
    parse(connection.get("/v2/breweries", name_params(name)))
  end

  def featured
    parse(connection.get("/v2/featured", api_key))
  end

  def all_styles
    parse(connection.get("/v2/styles", api_key))
  end

  def find_brewery(id)
    parse(connection.get("/v2/brewery/#{id}", api_key))
  end

  def beers_for_brewery(id)
    parse(connection.get("/v2/brewery/#{id}/beers", api_key))
  end

  def find_style(id)
    parse(connection.get("/v2/style/#{id}", api_key))
  end

  def find_beers_for_style(id)
    parse(connection.get("/v2/beers", style_params(id)))
  end

  def find_beer(id)
    parse(connection.get("/v2/beer/#{id}", api_key))
  end

  def find_beer_with_breweries(id)
    parse(connection.get("/v2/beer/#{id}", beer_with_breweries))
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private

  def connection
    @_connection
  end

  def name_params(name)
    {
      key: ENV["BREWERYAPIKEY"],
      name: name
    }
  end

  def brewery_params
    {
      key: ENV["BREWERYAPIKEY"],
      withLocations: "Y"
    }
  end

  def api_key
    {
      key: ENV["BREWERYAPIKEY"],
    }
  end

  def style_params(id)
    {
      key: ENV["BREWERYAPIKEY"],
      styleId: id
    }
  end

  def beer_with_breweries
    {
      key: ENV["BREWERYAPIKEY"],
      withBreweries: "Y"
    }
  end
end
