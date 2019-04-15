class GildedRose

  def initialize(items)
    @items = items
  end

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def update_quality()
    @items.each do |item|
      if ![AGED_BRIE, BACKSTAGE_PASSES].include?(item.name)
        item.quality -= 1 if item.quality > 0 && item.name != SULFURAS
      elsif item.quality < 50
        item.quality += 1
        if item.name == BACKSTAGE_PASSES
          item.quality += 1 if item.sell_in < 11
          item.quality += 1 if item.sell_in < 6
        end
      end

      item.sell_in -= 1 unless item.name == SULFURAS

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
