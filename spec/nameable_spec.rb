require './nameable'

describe Nameable do
  context 'When testing the Nameable class' do
    it 'should raise NotImplementedError when we call the correct_name method' do
      nameable_instance = described_class.new
      expect { nameable_instance.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
