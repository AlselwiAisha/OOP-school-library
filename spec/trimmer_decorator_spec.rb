require './person'
require './trimmer_decorator'

describe TrimmerDecorator do
  let(:trimmer) { TrimmerDecorator.new(Person.new(22, name: 'maximilianus')) }

  describe '#new' do
    it 'creates a new trimmer' do
      expect(trimmer).to be_a(TrimmerDecorator)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the trimmer' do
      expect(trimmer.correct_name).to eq('maximilian')
    end
  end
end
