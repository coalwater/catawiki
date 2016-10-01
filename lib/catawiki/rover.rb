module Catawiki
  class Rover
    ORIENTATIONS = %i(north east south west)
    ORIENTATIONS_MAPPING = { N: :north, E: :east, S: :south, W: :west }
    OPERATIONS = { M: :move, R: :rotate_right, L: :rotate_left }

    attr_accessor :x, :y, :orientation

    def initialize(x, y, orientation)
      self.x = x.to_i
      self.y = y.to_i
      self.orientation = ORIENTATIONS_MAPPING[orientation.to_sym]
    end

    def execute(operation)
      fail InvalidCommand, "No command #{operation}" unless OPERATIONS.keys.include? operation.to_sym

      send(OPERATIONS[operation.to_sym])
    end

    def rotate_right
      new_index = ORIENTATIONS.index(self.orientation) + 1
      new_index -= ORIENTATIONS.length if new_index >= ORIENTATIONS.length

      self.orientation = ORIENTATIONS[new_index]
    end

    def rotate_left
      new_index = ORIENTATIONS.index(self.orientation) - 1

      self.orientation = ORIENTATIONS[new_index]
    end

    def move
      case orientation
      when :north
        self.y += 1
      when :east
        self.x += 1
      when :south
        self.y -= 1
      when :west
        self.x -= 1
      end
    end

    def location
      [x, y]
    end

    def full_location
      [x,y, ORIENTATIONS_MAPPING.rassoc(orientation).first.to_s]
    end
  end

  class InvalidCommand < StandardError; end;
end
