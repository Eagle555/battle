require 'sinatra'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/names' do
    
    player = Player.new(params[:player])
    player2 = Player.new(params[:player2])
    $game = Game.new(player, player2)
    redirect '/play'
  end
  
  get '/play' do
    @player = $game.player1
    @player2 = $game.player2
    erb :play
  end

  get '/confirmation' do
    redirect '/play'
  end

  get '/attack' do
    @player = $game.player1
    @player2 = $game.player2
    $game.attack(@player2)
    erb :attack
  end
  
  run! if app_file == $0
end
  