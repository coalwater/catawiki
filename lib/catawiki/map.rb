module Catawiki
  class Map
    attr_accessor :x, :y, :rovers

    def initialize(x, y)
      self.x = x
      self.y = y
      self.rovers = []
    end

    def deploy_rover(rover)
      self.rovers << rover
    end

    def print
      rovers.each do |rover|
        puts rover.full_location.join
      end
    end
  end
end
