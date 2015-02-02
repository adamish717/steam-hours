FactoryGirl.define do
  factory :client do
    sequence(:name) { |n| "Example client #{n}" }
    sequence(:description) { |n| "Example client #{n} description." }
  end
end
