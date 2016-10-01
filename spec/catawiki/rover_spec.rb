require 'catawiki/rover'

describe Catawiki::Rover do
  let(:rover) { Catawiki::Rover.new(x, y, orientation_string) }
  let(:orientation_string) do
    Catawiki::Rover::ORIENTATIONS_MAPPING.rassoc(orientation).first.to_s
  end
  let(:orientation) { :north }
  let(:x) { 1 }
  let(:y) { 2 }

  describe '#rotate_right' do
    before { rover.rotate_right }

    context 'when the rover orientation is north' do
      let(:orientation) { :north }

      it 'should rotate the rover to the east' do
        expect(rover.orientation).to eq(:east)
      end
    end

    context 'when the rover orientation is east' do
      let(:orientation) { :east }

      it 'should rotate the rover to the south' do
        expect(rover.orientation).to eq(:south)
      end
    end

    context 'when the rover orientation is south' do
      let(:orientation) { :south }

      it 'should rotate the rover to the west' do
        expect(rover.orientation).to eq(:west)
      end
    end

    context 'when the rover orientation is west' do
      let(:orientation) { :west }

      it 'should rotate the rover to the north' do
        expect(rover.orientation).to eq(:north)
      end
    end
  end

  describe '#rotate_left' do
    before { rover.rotate_left }

    context 'when the rover orientation is north' do
      let(:orientation) { :north }

      it 'should rotate the rover to the west' do
        expect(rover.orientation).to eq(:west)
      end
    end

    context 'when the rover orientation is east' do
      let(:orientation) { :east }

      it 'should rotate the rover to the north' do
        expect(rover.orientation).to eq(:north)
      end
    end

    context 'when the rover orientation is south' do
      let(:orientation) { :south }

      it 'should rotate the rover to the east' do
        expect(rover.orientation).to eq(:east)
      end
    end

    context 'when the rover orientation is west' do
      let(:orientation) { :west }

      it 'should rotate the rover to the south' do
        expect(rover.orientation).to eq(:south)
      end
    end
  end

  describe 'move' do
    before { rover.move }

    context 'when the rover is at [2,2] and looking north' do
      let(:x) { 2 }
      let(:y) { 2 }
      let(:orientation) { :north }

      it 'should move to [2,3]' do
        expect(rover.location).to eq([2,3])
      end
    end

    context 'when the rover is at [4,5] and looking east' do
      let(:x) { 4 }
      let(:y) { 5 }
      let(:orientation) { :east }

      it 'should move to [5,5]' do
        expect(rover.location).to eq([5,5])
      end
    end

    context 'when the rover is at [3,1] and looking south' do
      let(:x) { 3 }
      let(:y) { 1 }
      let(:orientation) { :south }

      it 'should move to [3,0]' do
        expect(rover.location).to eq([3,0])
      end
    end

    context 'when the rover is at [3,2] and looking west' do
      let(:x) { 3 }
      let(:y) { 2 }
      let(:orientation) { :west }

      it 'should move to [2,2]' do
        expect(rover.location).to eq([2,2])
      end
    end
  end

  describe '#execute' do
    context 'when executing "M"' do
      before do
        allow(rover).to receive(:move)
        rover.execute('M')
      end

      it 'should call rover#move' do
        expect(rover).to have_received(:move)
      end
    end

    context 'when executing "L"' do
      before do
        allow(rover).to receive(:rotate_left)
        rover.execute('L')
      end

      it 'should call rover#rotate_left' do
        expect(rover).to have_received(:rotate_left)
      end
    end

    context 'when executing "R"' do
      before do
        allow(rover).to receive(:rotate_right)
        rover.execute('R')
      end

      it 'should call rover#rotate_right' do
        expect(rover).to have_received(:rotate_right)
      end
    end

    context 'when executing "Q"' do
      it 'should raise an error' do
        expect{ rover.execute('Q') }.to raise_error(Catawiki::InvalidCommand)
      end
    end
  end
end
