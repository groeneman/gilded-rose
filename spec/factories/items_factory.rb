FactoryBot.define do
  factory :item do
    initialize_with { new(name, sell_in, quality) }

    name { 'Standard Item' }
    quality { 12 }
    sell_in { 3 }


    trait :sulfuras do
      name { 'Sulfuras, Hand of Ragnaros' }
    end

    trait :brie do
      name { 'Aged Brie' }
    end

    trait :backstage_passes do
      name { 'Backstage passes to a TAFKAL80ETC concert' }
    end
  end
end
