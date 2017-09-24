require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require('./lib/word')
require "pry"

get('/') do
	@words = Word.all
	erb(:index)
end

get('/new') do
erb(:new) 
end

post('/') do
	term = params.fetch("word")
	definition = params.fetch("definition")
	@word = Word.new(:word => term, :definition => definition)
	@word.save
	redirect "/"
end

get('/:word') do


erb(:definition)
end