require 'sinatra'
require 'pi_piper'

class Pi
  def initialize
    off
  end

  def on?
    !off?
  end

  def off?
    pin.read
    pin.off?
  end

  def on
    pin.on
  end

  def off
    pin.off
  end

  private

  def pin
    @pin ||= Sinatra::Base.development? ? MockPin.new : PiPiper::Pin.new(:pin => 4, :direction => :out)
  end

end

class MockPin
  def initialize
    @on = false
  end

  def read
  end

  def on
    @on = true
  end

  def off
    @on = false
  end

  def off?
    !@on
  end
end
