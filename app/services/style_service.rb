class StyleService
  def initialize
    @_connection = Faraday.new("http://api.brewerydb.com")
  end

  def all_styles
    parse(connection.get("/v2/styles", api_key))
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private
  def connection
    @_connection
  end

  def api_key
    {
      key: ENV["BREWERYAPIKEY"],
    }
  end
end
