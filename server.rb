require 'sinatra'
require 'haml'
require_relative 'database/setup'
require_relative 'repositories/questions'

get '/' do
  haml :index
end

post '/search' do
  seach_results = CUC::Questions.random(5)
  haml :results, locals: { results: seach_results }
end
