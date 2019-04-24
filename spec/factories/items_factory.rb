FactoryBot.define do
  factory :item do
    initialize_with { new(name, sell_in, quality) }

    name { 'Standard Item' }
    quality { 12 }
    sell_in { 3 }
  end
end
