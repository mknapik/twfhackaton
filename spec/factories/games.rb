FactoryGirl.define do
  factory :game do
    name 'my game'
    description 'MyText'
    association :game_type
  end
end
