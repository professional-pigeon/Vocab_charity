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
  word1 = Word.new({:name => params[:word_name], :meaning => params[:meaning]})
  word1.save
  @words = Word.all
  erb(:words)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/word/:id/update_word') do
  @word = Word.find(params[:id].to_i)
  erb(:update_word)
end

post('/word/:id') do
  @word = Word.find(params[:id].to_i)
  word = nil
  meaning = nil
  if params[:word_name].length != 0
    word = params[:word_name]
  end
  if params[:meaning].length != 0
    meaning = params[:meaning]
  end
  @word.update(word, meaning)
  @word.save
  erb(:word)
end

delete('/word/:id') do
end