require 'sinatra'

require 'sinatra/reloader'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/names' do
    session[:player] = params[:player]
    session[:player2] = params[:player2]
    redirect '/play'
  end
  
  get '/play' do
    @player = session[:player]
    @player2 = session[:player2]
    erb :play
  end
  
  run! if app_file == $0
end
  