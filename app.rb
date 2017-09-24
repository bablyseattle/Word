require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require('./lib/word')
require "pry"

get('/') do
	word1 = Word.new(:word => "ME")
	word1.save
	@words = Word.all
	erb(:index)
end

get('/new') do
erb(:new)
end