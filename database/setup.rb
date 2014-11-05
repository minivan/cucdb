require 'sequel'

module CUC
  DB = Sequel.connect(ENV['PG_CONNECTION_PATH'])
end