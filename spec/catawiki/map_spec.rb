require 'catawiki/map'
require 'catawiki/rover'

describe Catawiki::Map do
  let(:map) { Catawiki::Map.new(5,5) }
  let(:rover) { Catawiki::Rover.new(0, 0, 'N') }

  describe '#deploy_rover' do
    before { map.deploy_rover(rover) }

    it 'should add the rover to the map' do
      expect(map.rovers).to include(rover)
    end
  end

  describe '#print' do
    let(:rover1) { Catawiki::Rover.new(1, 1, 'N') }
    let(:rover2) { Catawiki::Rover.new(2, 2, 'E') }
    let(:rover3) { Catawiki::Rover.new(3, 3, 'S') }

    before do
      map.deploy_rover(rover1)
      map.deploy_rover(rover2)
      map.deploy_rover(rover3)
    end

    it 'should print the rovers in the map' do
      expect{ map.print }.to output("11N\n22E\n33S\n").to_stdout
    end
  end
end
