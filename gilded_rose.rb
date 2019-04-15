class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def update_quality()
    @items.each do |item|
      item.quality = new_quality(item)
      item.sell_in -= 1 unless item.name == SULFURAS
    end
  end

  def new_quality(item)
    new_quality = if item.name == BACKSTAGE_PASSES
                    if item.sell_in > 10
                      item.quality + 1
                    elsif item.sell_in > 5
                      item.quality + 2
                    elsif item.sell_in > 0
                      item.quality + 3
                    else
                      0
                    end
                  elsif item.name == SULFURAS
                    item.quality
                  else
                    direction = item.name == AGED_BRIE ? 1 : -1
                    expired_multiplier = item.sell_in <= 0 ? 2 : 1
                    item.quality + direction * expired_multiplier
                  end

    [50, [new_quality, 0].max].min
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
