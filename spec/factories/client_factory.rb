FactoryGirl.define do
  factory :client do
    name        { "#{Faker::Company.name} #{Faker::Company.suffix}" }
    description { Faker::Company.bs }

    # client_with_pos will create post data after the user has been created
    trait :with_pos do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        po_count 5
      end

      # the after(:create) yields two values; the client instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the client is associated properly to the PO
      after(:build) do |client, evaluator|
        create_list(:purchase_order, evaluator.po_count, client: client)
      end
    end
  end
end
