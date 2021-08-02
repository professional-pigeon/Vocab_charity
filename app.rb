require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
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

post('/words') do
  word1 = Word.new({:word => params[:word_name]}, nil)
  word1.save
  @words = Word.all
  erb(:words)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  @definitions = @word.definitions
  erb(:word)
end

post('/word/:id/update_word') do
  @word = Word.find(params[:id].to_i)
  if params[:spelling] != ""
    @word.update(params[:spelling])
    redirect to ("word/#{params[:id]}")   
  end
end

post('/word/:id/add_definition') do
  @word = Word.find(params[:id].to_i)
  if params[:def_name] != ""
    @definition = Definition.new({:meaning => params[:def_name], :word_id => params[:id].to_i}, nil)
    @definition.save
    redirect to ("word/#{params[:id]}")    
  else
    redirect to ("word/#{params[:id]}")    
  end
end

post('/word/:id/delete') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  redirect to ('/words')
end

get('/definition/:id') do
  @definition = Definition.find(params[:id].to_i)
  erb(:update_def)
end

post('/definition/:id/delete') do
  @definition = Definition.find(params[:id].to_i)
  word_id = @definition.word_id
  @definition.delete
  redirect to ("/word/#{word_id}")
end