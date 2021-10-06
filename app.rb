require 'sinatra'
require 'sinatra/reloader'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/names' do
    $player = Player.new(params[:player])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end
  
  get '/play' do
    @player = $player.name
    p @player
    @player2 = $player2.name
    p @player2
    erb :play
  end

  get '/attack' do
    @player = $player.name
    @player2 = $player2.name
    erb :attack
  end
  
  run! if app_file == $0
end
  