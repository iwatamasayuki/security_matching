FactoryBot.define do
  factory :message do
    association :user
    association :guard
    text {Faker::Lorem.sentence}
  end
end
