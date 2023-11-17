require './person'
require './capitalize_decorator'

describe CapitalizeDecorator do
  let(:capitalize) { CapitalizeDecorator.new(Person.new(22, name: 'aisha')) }

  describe '#new' do
    it 'creates a new capitalize' do
      expect(capitalize).to be_a(CapitalizeDecorator)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the capitalize' do
      expect(capitalize.correct_name).to eq('Aisha')
    end
  end
end
