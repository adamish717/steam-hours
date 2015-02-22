FactoryGirl.define do
  def random_time_today
    Faker::Time.between(Time.now.beginning_of_day, Time.now.end_of_day)
  end

  start_at, end_at = [random_time_today, random_time_today].sort

  factory :entry do
    start_at       start_at
    end_at         end_at
    description    { Faker::Hacker.say_something_smart }
    parts_used     { Faker::Code.isbn }
    purchase_order
    user
  end
end
