require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/add_word') do
  erb(:add_word)
end

post('/words') do
  erb(:word)
end

get('/word/:id') do
  erb(:word)
end

get('/word/:id/update_word') do
end