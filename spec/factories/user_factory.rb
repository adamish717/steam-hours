FactoryGirl.define do
  password = Faker::Internet.password
  factory :user do
    email                 { Faker::Internet.email }
    password              password
    password_confirmation password

    trait :admin do
      admin true
    end

    factory :admin,   traits: [:admin]
  end
end
