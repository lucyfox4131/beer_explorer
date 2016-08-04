class FeaturedService < BaseService

  def featured
    parse(connection.get("/v2/featured", api_key))
  end

  private

  def api_key
    {
      key: ENV["BREWERYAPIKEY"]
    }
  end
end
