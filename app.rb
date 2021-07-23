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
  word1 = Word.new({:word => params[:word_name], :meaning => params[:meaning]}, nil)
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
  if params[:meaning_new] != nil
    meaning = ""
    meaning.concat(@word.meaning, ". ", params[:meaning_new])
    @word.update(nil, meaning)
    @word.save
    erb(:word)
  else
    meaning = nil
    if params[:meaning] != nil
      meaning = params[:meaning]
    end
    @word.update(nil, meaning)
    @word.save
    erb(:word)
  end
end

post('/word/:id/delete') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @words = Word.all
  redirect to ('/words')
end