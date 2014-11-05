require 'sinatra'
require 'haml'
require_relative 'setup'

get '/' do
  haml :index
end

post '/search' do
  terms = params["term"].split(" ")
  search_results = CUC::Questions.search(terms).to_a
  prefix = "<span class=match>"
  postfix = "</span>"
  terms.each do |term|
    search_results.each do |question|
      question[:text].gsub!(term, prefix + term + postfix)
    end
  end
  haml :results, locals: { results: search_results }
end
