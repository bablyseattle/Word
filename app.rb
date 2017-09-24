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
	definition1 = params.fetch("definition1")
	definition2 = params.fetch("definition2")
	definition3 = params.fetch("definition3")
	@word = Word.new(:word => term)
	@word.add_definition(definition1)
	@word.add_definition(definition2)
	@word.add_definition(definition3)
	@word.save
	redirect "/"
end

get('/:word') do
	@word = Word.find_word(params[:word])
	erb(:definition)
end