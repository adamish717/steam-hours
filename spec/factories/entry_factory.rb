FactoryGirl.define do
  factory :entry do
    start_at Time.now
    end_at 8.hours.from_now
    description 'Example entry.'
    parts_used 'Example parts used.'
    purchase_order
  end
end
