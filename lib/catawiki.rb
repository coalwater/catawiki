require 'catawiki/map'
require 'catawiki/rover'

module Catawiki
  def self.run(args)
    input_file = args[0]
    File.open(input_file, 'r') do |file|
      map_data = file.readline.split(' ')
      map = Map.new(*map_data)

      loop do
        rover_data = file.readline.chomp.split(' ')
        rover = Catawiki::Rover.new(*rover_data)
        map.deploy_rover(rover)
        rover_operations = file.readline
        rover_operations.chomp.split('').each do |ro|
          rover.execute(ro)
        end

        break if file.eof?
      end

      map.print
    end
  end
end
