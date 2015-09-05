FactoryGirl.define do
  factory :game do
    name 'MyString'
    description 'MyText'
    association :game_type
  end

end
