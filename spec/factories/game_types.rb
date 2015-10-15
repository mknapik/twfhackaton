FactoryGirl.define do
  factory :game_type do
    name 'game type'
    description 'MyText'

    trait :sequence do
      name 'sekwencja'
    end

    trait :subset do
      name 'podzbiór'
    end
  end
end
