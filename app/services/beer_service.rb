class BeerService

  def initialize
    @_connection = Faraday.new("http://api.brewerydb.com")
  end

  def beer_by_name(name)
    parse(connection.get("/v2/beers", name_params(name)))
  end

  def random
    parse(connection.get("/v2/beer/random", api_key))
  end

  def all_styles
    parse(connection.get("/v2/styles", api_key))
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def name_params(name)
    {
      key: ENV["BREWERYAPIKEY"],
      name: name
    }
  end

  def api_key
    {
      key: ENV["BREWERYAPIKEY"],
    }
  end

  private

  def connection
    @_connection
  end
end
