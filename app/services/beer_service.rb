class BeerService < BaseService

  def beer_by_name(name)
    parse(connection.get("/v2/beers", name_params(name)))
  end

  def find_beer(id)
    parse(connection.get("/v2/beer/#{id}", beer_with_breweries))
  end

  private

  def name_params(name)
    {
      key: ENV["BREWERYAPIKEY"],
      name: name
    }
  end

  def beer_with_breweries
    {
      key: ENV["BREWERYAPIKEY"],
      withBreweries: "Y"
    }
  end
end
