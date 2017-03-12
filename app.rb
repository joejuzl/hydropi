require 'sinatra'
require_relative 'pi'

require 'ap'
require 'pry-byebug'

class App < Sinatra::Application
  def initialize
    super()
    @pi = Pi.new
  end

  get '/' do
    erb :home, :locals => {on:  @pi.on?}
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
