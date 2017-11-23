namespace :db do
  desc 'Refresh all the database !'
  task :fresh, [] => :environment do
    raise 'Not allowed to run on production' if Rails.env.production?

    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute

    puts 'Fresh data ready !'
  end
end
