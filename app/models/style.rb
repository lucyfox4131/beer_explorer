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

  def self.get_all
    styles = BeerService.new.all_styles
    create_styles(styles['data'])
  end

  def self.create_styles(styles)
    styles.map do |style|
      new(style)
    end
  end
end
