# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user_id { User.first.id }
    description { FFaker::Book.description }
    # image { FFaker::Image.file }

    trait :invalid_image do
      image { FFaker::Image.file }
    end
  end
end
