require 'sinatra'

class Schedule
  FILENAME = 'cron.txt'

  def cron=(cron)
    write(cron)
  end

  def cron
    read
  end

  private

  def write(data)
    File.open(FILENAME, 'w') do |file|
      file.write data
    end
  end

  def read
    unless File.exists?(FILENAME)
      write('* * * * *')
    end
    File.open(FILENAME, 'r') do |file|
      file.read
    end
  end
end