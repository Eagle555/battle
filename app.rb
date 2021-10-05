require 'sinatra'

require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/names' do
    @player = params[:player]
    @player2 = params[:player2]
    erb(:play)
  end
  
  
  run! if app_file == $0
end
  