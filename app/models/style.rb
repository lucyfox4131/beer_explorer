class Style
  attr_reader :style_id, :name, :description, :ibu_min, :ibu_max, :abv_min, :abv_max

  def initialize(style)
    @style_id = style['id']
    @name = style['name']
    @description = style['description']
    @ibu_min = style['ibuMin']
    @ibu_max = style['ibuMax']
    @abv_min = style['abvMin']
    @abv_max = style['abvMax']
  end

  def self.service
    @service = @service ||= StyleService.new
  end

  def self.get_all
    Rails.cache.fetch("all_styles/get_all", expires_in: 3.days) do
      styles = service.all_styles
      create_styles(styles['data'])
    end
  end

  def self.create_styles(styles)
    styles.map do |style|
      new(style)
    end
  end

  def self.find_style(id)
    Rails.cache.fetch("beer_style_#{id}/find_style", expires_in: 3.days) do
      style = service.find_style(id)
      new(style['data'])
    end
  end

  def beers
    Rails.cache.fetch("beers_for_style#{self.style_id}", expires_in: 3.days) do
      beers = service.find_beers_for_style(self.style_id)
      Beer.create_beers(beers["data"])
    end
  end

  def info_paragraph
    "Beers of this style typically have an IBU range of #{ibu_min} - #{ibu_max}, and an ABV range of #{abv_min}% - #{abv_max}%."
  end
end
