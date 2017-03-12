require 'sinatra'
require_relative 'pi'

class App < Sinatra::Application
  set :bind, '0.0.0.0'

  def initialize
    super()
    @pi = Pi.new
  end

  get '/' do
    erb :home, locals: { action:  @pi.on? ? 'off' : 'on'  }
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
