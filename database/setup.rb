require 'sequel'

module CUC
  PG_CONNECTION_PATH = 'postgres://postgres:postgres@localhost/cuc'
  DB = Sequel.connect(PG_CONNECTION_PATH)
end