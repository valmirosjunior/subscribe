FactoryBot.define do
  factory :product, class: 'Product' do
    description { Faker::Commerce.product_name }
    value { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 10) }
    imported { Faker::Boolean.boolean }

    initialize_with { new(description, value, quantity, imported) }

    trait :imported do
      imported { true }
    end

    trait :not_imported do
      imported { false }
    end

    trait :exempt do
      description { 'book' }
    end

    trait :not_exempt do
      description { 'perfume' }
    end
  end
end
