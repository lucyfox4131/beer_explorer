class BeerService

  def initialize
    @_connection = Faraday.new("http://api.brewerydb.com")
  end

  def beer_by_name(name)
    parse(connection.get("/v2/beers", name_params(name)))
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

  private

  def connection
    @_connection
  end
end
