require_relative 'setup'
require 'json'
require 'dotenv/tasks'


namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] => :dotenv do |t, args|
    Sequel.extension :migration

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(CUC::DB, "database/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(CUC::DB, "database/migrations")
    end
  end

  desc 'Seed the data'
  task :seed => :dotenv do |t|
    seeds = File.read('./database/seeds/initial_data.json')
    data = JSON.parse(seeds)
    puts "Inserting #{data.size} questions"
    CUC::Questions.destroy_all
    CUC::Questions.batch_insert(data)
  end
end