require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'sinatra/namespace'
require 'sinatra/json'
require 'pry-byebug'

require_relative 'lib/tap'
require_relative 'lib/schedule'

class App < Sinatra::Base
  register Sinatra::Namespace

  def initialize
    super()
    @tap = Tap.new
    @schedule = Schedule.new
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

    get '/schedule' do
      json cron: @schedule.cron
    end

    post '/schedule' do
      body = JSON.parse(request.body.read).symbolize_keys
      @schedule.cron = body[:cron]
    end
  end
end

App.set :bind, '0.0.0.0'
App.run!
