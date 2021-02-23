FactoryBot.define do
  factory :guard do
    association :user
    company               { Faker::Company.name  }
    guard_name            { Gimei.kanji }
    name_kana             { Gimei.katakana }
    gender                { "男性" }
    age                   { 18 }
    experience            { 3 }
    qualification         { "警備員指導教育責任者(１号)" }

    after(:build) do |guard|
      guard.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
