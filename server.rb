require 'sinatra'
require 'haml'
require_relative 'setup'

get '/' do
  haml :index
end

post '/search' do
  terms = params["term"].split(" ")
  search_results = CUC::Questions.search(terms).to_a
  #TODO: please fix this, i feel very bad about it
  prefix = "%<%"
  postfix = "%>%"
  terms.sort_by { |i| -i.length }.each do |term|
    search_results.each do |question|
      question[:text].gsub!(term, prefix + term + postfix)
    end
  end
  search_results.each do |question|
    question[:text].gsub!(prefix, "<span class=match>")
  end
  search_results.each do |question|
    question[:text].gsub!(postfix, "</span>")
  end
  haml :results, locals: { results: search_results }
end
