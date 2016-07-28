class Brewery
  attr_reader :brewery_id, :name, :description, :website, :image, :address
  
  def initialize(brewery)
    @brewery_id       = brewery["id"]
    @name             = brewery["name"]
    @description      = brewery["description"]
    @website          = brewery["website"]
    @image            = brewery["images"]["icon"]
    @address          = brewery["locations"].first["streetAddress"]
  end
end
