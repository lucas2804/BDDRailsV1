class Sleeper
  @queue = :sleep

  def self.perform(seconds)
    puts 'asdsadsad1'
    5 + seconds
  end
end
