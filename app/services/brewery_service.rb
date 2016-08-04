class BreweryService < BaseService

  def brewery_by_name(name)
    parse(connection.get("/v2/breweries", name_params(name)))
  end

  def find_brewery(id)
    parse(connection.get("/v2/brewery/#{id}", api_key))
  end

  def beers_for_brewery(id)
    parse(connection.get("/v2/brewery/#{id}/beers", beer_with_breweries))
  end

  def brewery_by_zip(zipcode)
    parse(connection.get("/v2/locations", zip_params(zipcode)))
  end

  private
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

  def beer_with_breweries
    {
      key: ENV["BREWERYAPIKEY"],
      withBreweries: "Y"
    }
  end

  def zip_params(zip)
    {
      key: ENV["BREWERYAPIKEY"],
      postalCode: zip
    }
  end
end
