class BaseService

  def connection
    Faraday.new("http://api.brewerydb.com")
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
