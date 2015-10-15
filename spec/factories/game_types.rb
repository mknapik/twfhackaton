FactoryGirl.define do
  factory :game_type do
    name 'game type'
    description 'MyText'

    trait :sequence do
      id 2
      name 'sekwencja'
    end

    trait :subset do
      id 1
      name 'podzbiór'
    end
  end
end
