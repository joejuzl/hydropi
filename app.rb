require 'sinatra'
require_relative 'tap'
require 'sinatra/reloader' if development?
require 'sinatra/namespace'
require 'sinatra/json'

class App < Sinatra::Application
  set :bind, '0.0.0.0'

  def initialize
    super()
    @tap = Tap.new
  end

  get '/' do
    erb :home
  end

  namespace '/tap' do
    get '/' do
      json on: @tap.on?
    end

    post '/on' do
      @tap.on
      json message: 'success'
    end

    post '/off' do
      @tap.off
      json message: 'success'
    end
  end
end

App.run!
