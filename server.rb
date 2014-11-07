require 'sinatra'
require 'haml'
require_relative 'setup'

PER_PAGE = 3

get '/' do
  haml :index, locals: { term: nil }
end

get '/search' do
  terms = params["term"].split(" ")
  haml :results, locals: { results: search(terms), term: params["term"] }
end

def search(terms)
  search_results = CUC::Questions.search(terms, page: params[:page]).to_a
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

  search_results
end