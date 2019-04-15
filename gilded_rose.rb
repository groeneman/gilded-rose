class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def update_quality()
    @items.each do |item|
      if item.name != AGED_BRIE and item.name != BACKSTAGE_PASSES
        if item.quality > 0
          if item.name != SULFURAS
            item.quality -= 1
          end
        end
      else
        if item.quality < 50
          item.quality += 1
          if item.name == BACKSTAGE_PASSES
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      end
      if item.name != SULFURAS
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != AGED_BRIE
          if item.name != BACKSTAGE_PASSES
            if item.quality > 0
              if item.name != SULFURAS
                item.quality -= 1
              end
            end
          else
            item.quality = 0
          end
        else
          if item.quality < 50
            item.quality += 1
          end
        end
      end
    end
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
