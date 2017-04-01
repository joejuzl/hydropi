require 'sinatra'
require_relative 'pi'
require 'sinatra/reloader' if development?

class App < Sinatra::Application
  set :bind, '0.0.0.0'

  def initialize
    super()
    @pi = Pi.new
  end

  get '/' do
    action = @pi.on? ? 'off' : 'on'
    erb :home, locals: { action:  action }
  end

  post '/on' do
    @pi.on
    redirect '/'
  end

  post '/off' do
    @pi.off
    redirect '/'
  end
end

App.run!
