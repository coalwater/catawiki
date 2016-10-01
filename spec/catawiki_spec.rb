require 'catawiki'

describe Catawiki do
  describe '.run' do
    let(:file_contents) { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n" }
    let(:expected_output) { "13N\n51E\n" }

    before do
      allow(File).to(receive(:open)).and_yield(StringIO.new(file_contents))
    end

    it 'should print the final position of the rovers' do
      expect{ Catawiki.run(['text.txt']) }.to output(expected_output).to_stdout
    end
  end
end
