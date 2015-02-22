FactoryGirl.define do
  factory :purchase_order do
    title       { Faker::Company.bs }
    description { Faker::Company.catch_phrase }
    active true
    client
  end
end
