# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
  BRIE = 'Aged Brie'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'

  def update_quality
    @items.each do |item|
      if (item.name != BRIE) && (item.name != BACKSTAGE_PASS)
        if item.quality > 0
          item.quality = item.quality - 1 if item.name != SULFURAS
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == BACKSTAGE_PASS
            if item.sell_in < 11
              item.quality = item.quality + 1 if item.quality < 50
            end
            if item.sell_in < 6
              item.quality = item.quality + 1 if item.quality < 50
            end
          end
        end
      end
      item.sell_in = item.sell_in - 1 if item.name != SULFURAS
      if item.sell_in < 0
        if item.name != BRIE
          if item.name != BACKSTAGE_PASS
            if item.quality > 0
              item.quality = item.quality - 1 if item.name != SULFURAS
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          item.quality = item.quality + 1 if item.quality < 50
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

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
