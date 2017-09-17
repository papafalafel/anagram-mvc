get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
  erb :show
end

post '/' do
  @word = params[:word]
  if Word.valid_input?(@word)
    redirect "/anagrams/#{@word}"
  else
    @error = "Only 3 letter words please!"
    erb:index
  end
end
