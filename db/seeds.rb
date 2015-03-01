require 'factory_girl_rails'

def banner text
  puts '*' * 60
  puts " #{text}"
  puts '*' * 60
end

def work_week d
  d.beginning_of_week ... d.beginning_of_week + 5
end

def random_hour d
  (d.beginning_of_day + rand(6..20).hour + rand(0..60).minutes).to_datetime
end

def work_shift d
  [random_hour(d), random_hour(d)].sort
end

users = []
clients = []
purchase_orders = []

puts 'Creating example user'
users << FactoryGirl.create(:user, email: 'user@example.com', password: 'password', password_confirmation: 'password')

puts 'Creating example admin'
users << FactoryGirl.create(:user, email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

puts 'Creating some sample clients'
clients.concat FactoryGirl.create_list :client, 3

puts 'Creating purchase orders for those clients'
clients.each do |client|
  purchase_orders.concat FactoryGirl.create_list :purchase_order, 3, client: client
end

puts 'Creating fake time entries'
users.each do |user|
  8.times.each do |n|
    work_week(n.weeks.ago.to_date).each do |date|
      start_at, end_at = work_shift(date)
      FactoryGirl.create :entry,
        start_at: start_at,
        end_at: end_at,
        purchase_order: purchase_orders.sample,
        user: user
    end
  end
end

puts

banner '''
# Login as User

email: user@example.com
password: password
'''

puts

banner '''
# Login as Admin

email: admin@example.com
password: password
'''
