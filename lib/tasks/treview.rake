namespace :treview do
  desc "create travels"
  task :travels => :environment do
    puts "***Creating travels"

    Travel.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence! 'travels'

    cities = ['Paris', 'New York', 'Tokyo', 'Seoul', 'Bangkok', 'Madrid']

    100.times do
      Travel.create(name: "#{Faker::Lorem.word} in #{cities[rand(cities.length)]}")
    end

    puts "***#{Travel.count} travel subjects are created."
  end

  desc "create videos"
  task videos: :environment do
    puts "***Creating videos"

    Video.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence! 'videos'

    vids = %w( DfSCBga7MbE kr24vkfvzT8 1hkG8G7Q8E0 I3dezFzsNss gAal8xHfV0c AAbokV76tkU yMqL1iWfku4 6SwiSpudKWI q_gfD3nvh-8
                XgkfqIrDeS4 3Ua46g4kpic bSeFrPrqZ2A PYVuiDgCNho Tppzb6tcZNQ FrolQnVuPqs
                YDugfMegHuE 4dzQ9rk_AaQ 116_uIB2DP4 wsgsQ_1QFBs IPCCT_gqvd0 IHKUDUfnLn4
                wKzNYlQBh_I PX3k11lAwc8 HkMNOlYcpHg Ks-_Mh1QhMc fFfVkXekgH4)

    user = User.first

    vids.each do |vid|
      video = Video.create_from_youtube(vid)
      if video
        video.travel = Travel.offset(rand(Travel.count)).first
        video.uploader = user if user.present?
        video.save
        puts "#{vid} was created"
      else
        puts "#{vid} was rejected"
      end
    end
  end
end
