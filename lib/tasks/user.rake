namespace :user do

  desc 'Create a new user'
  task :new => :environment do
    user = build_user
    if user.valid?
      user.save
      puts 'The user is created'
    else
      puts 'This user is not valid'
    end
  end
end

def build_user
  print 'email: '
  email = STDIN.gets.chomp
  print 'Password: '
  password = STDIN.noecho(&:gets).chomp
  puts
  User.new(email: email,
           password: password,
           password_confirmation: password)
end
