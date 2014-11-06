require_relative 'setup'
require 'csv'
require 'dotenv/tasks'
require 'pry'

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
    seeds = File.read('./database/seeds/data.csv')
    # replace the first row in the file with a custom header
    split = seeds.split("\n")
    split[0] = "timestamp,number,text,answer,criteria,comment,source,author,game_identifier,team"
    seeds = split.join("\n")

    # Parse the CSV
    csv = CSV.new(seeds, :headers => true, :header_converters => :symbol, :converters => :all)
    data = csv.to_a
    data.map!(&:to_hash)
    data.each{ |item| item.delete(:timestamp) }
    data = data.delete_if { |item| item[:number] == nil }

    p "Imported #{data.size} questions"
    CUC::Questions.destroy_all
    CUC::Questions.batch_insert(data)
  end
end