class Beer
  attr_reader :id, :name, :description, :abv, :ibu, :style_name, :style_description
  def initialize(beer)
    @id                 = beer["data"]["id"]
    @name               = beer["data"]["name"]
    @description        = beer["data"]["description"]
    @abv                = beer["data"]["abv"]
    @ibu                = beer["data"]["ibu"]
    @style_name         = beer["data"]["style"]["name"]
    @style_description  = beer["data"]["style"]["description"]
  end
end
