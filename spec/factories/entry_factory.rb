FactoryGirl.define do
  factory :entry do
    start_at 8.hours.ago
    end_at Time.now
    description 'Example entry.'
    parts_used 'Example parts used.'
    purchase_order
    user
  end
end
