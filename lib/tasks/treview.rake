namespace :treview do
  desc "create travels"
  task :travels => :environment do
    puts "***Creating travels"

    Travel.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence! 'travels'

    100.times do
      Travel.create(name: "#{Faker::Lorem.word} in #{Faker::Address.city}")
    end

    puts "***#{Travel.count} travel subjects are created."
  end
end
