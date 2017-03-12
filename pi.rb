require 'pi_piper'

class Pi
  def initialize
    @pin = PiPiper::Pin.new(:pin => 4, :direction => :out)
  end

  def on?
    @pin.on?
  end

  def off?
    @pin.off?
  end

  def on
    @pin.on
  end

  def off
    @pin.off
  end
end
