namespace :treview do
  # desc "create travels"
  # task :travels => :environment do
  #   puts "***Creating travels"

  #   Travel.destroy_all
  #   ActiveRecord::Base.connection.reset_pk_sequence! 'travels'

  #   cities = ['Paris', 'New York', 'Tokyo', 'Seoul', 'Bangkok', 'Madrid']

  #   100.times do
  #     Travel.create(subject: "#{Faker::Lorem.word} in #{cities[rand(cities.length)]}")
  #   end

  #   puts "***#{Travel.count} travel subjects are created."
  # end

  # desc "create videos"
  # task videos: :environment do
  #   puts "***Creating videos"

  #   Video.destroy_all
  #   ActiveRecord::Base.connection.reset_pk_sequence! 'videos'

  #   vids = %w( DfSCBga7MbE kr24vkfvzT8 1hkG8G7Q8E0 I3dezFzsNss gAal8xHfV0c AAbokV76tkU yMqL1iWfku4 6SwiSpudKWI q_gfD3nvh-8
  #               XgkfqIrDeS4 3Ua46g4kpic bSeFrPrqZ2A PYVuiDgCNho Tppzb6tcZNQ FrolQnVuPqs
  #               YDugfMegHuE 4dzQ9rk_AaQ 116_uIB2DP4 wsgsQ_1QFBs IPCCT_gqvd0 IHKUDUfnLn4
  #               wKzNYlQBh_I PX3k11lAwc8 HkMNOlYcpHg Ks-_Mh1QhMc fFfVkXekgH4)

  #   user = User.first

  #   vids.each do |vid|
  #     video = Video.create_from_youtube(vid)
  #     if video
  #       video.travel = Travel.offset(rand(Travel.count)).first
  #       video.uploader = user if user.present?
  #       video.save
  #       puts "#{vid} was created"
  #     else
  #       puts "#{vid} was rejected"
  #     end
  #   end
  # end

  desc "create dummy users"
  task :dummy_users => :environment do
    puts "***Creating dummy users"

    if User.count == 0
      puts "***You should log in first"
      return
    end

    5.times do |i|
      User.create(name: Faker::Name.name, email: Faker::Internet.email)
    end
  end

  desc "make me admin"
  task admin: :environment do
    u = User.first
    u.update_attribute(:admin, true)
  end

  desc "create videos_with_subject"
  task videos_with_subject: :environment do
    Video.destroy_all
    Travel.destroy_all

    ActiveRecord::Base.connection.reset_pk_sequence! 'travels'
    ActiveRecord::Base.connection.reset_pk_sequence! 'videos'

    Video.sample_video('DfSCBga7MbE', 'Do something in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('kr24vkfvzT8', 'Do something in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('1hkG8G7Q8E0', 'Do something in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('Syy1vZ09sv8', 'Do something in Paris', User.offset(rand(User.count)).first)

    Video.sample_video('I3dezFzsNss', 'Clubbing in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('gAal8xHfV0c', 'Clubbing in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('AAbokV76tkU', 'Clubbing in Paris', User.offset(rand(User.count)).first)
    Video.sample_video('sMgpyv1tHUk', 'Clubbing in Paris', User.offset(rand(User.count)).first)

    Video.sample_video('yMqL1iWfku4', '남대문 투어 in 서울', User.offset(rand(User.count)).first)
    Video.sample_video('6SwiSpudKWI', '남대문 투어 in 서울', User.offset(rand(User.count)).first)
    Video.sample_video('XgkfqIrDeS4', '남대문 투어 in 서울', User.offset(rand(User.count)).first)

    Video.sample_video('w4y3lLrqlTQ', 'Meeting at 양재역', User.offset(rand(User.count)).first)
    Video.sample_video('JZivlwF6jsM', 'Meeting at 양재역', User.offset(rand(User.count)).first)
    Video.sample_video('nqW8vJTiN8I', 'Meeting at 양재역', User.offset(rand(User.count)).first)

    Video.sample_video('TNIc-5GyxZ4', 'Eat lunch with your family', User.offset(rand(User.count)).first)
    Video.sample_video('BieutE_OuA8', 'Eat lunch with your family', User.offset(rand(User.count)).first)
    Video.sample_video('bQyzjU_4q_I', 'Eat lunch with your family', User.offset(rand(User.count)).first)

    Video.sample_video('ZwZGAqZgts', 'Run at the beach', User.offset(rand(User.count)).first)    
    Video.sample_video('bps6X6ivQ7E', 'Run at the beach', User.offset(rand(User.count)).first)
    Video.sample_video('EjUOFavhxTs', 'Run at the beach', User.offset(rand(User.count)).first)
    Video.sample_video('Fiis00ROfT4', 'Run at the beach', User.offset(rand(User.count)).first)
    Video.sample_video('78RM9Uf724M', 'Run at the beach', User.offset(rand(User.count)).first)


    puts "***#{Video.count} videos are created."
  end


end
