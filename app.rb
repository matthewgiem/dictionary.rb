require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end

post("/words") do
  word = params.fetch('word')
  Word.new(word).save()
  @words = Word.all()
  erb(:index)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/home') do
  @words = Word.all()
  erb(:index)
end

post('/words/:id/definition') do
  id = params.fetch('id').to_i()
  definition = params.fetch('definition')
  definition.save()
  @word = Word.find(id)
  @words = Word.all()
  erb(:index)
end
