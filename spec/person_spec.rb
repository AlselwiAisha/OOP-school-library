require './person'

describe Person do
  let(:person) { Person.new(20) }

  describe '#initialize' do
    it 'sets age, id, name, and parent_permission' do
      expect(person.age).to eq(20)
      expect(person.id).to be_a(Integer)
      expect(person.name).to eq('Unknown')
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('Unknown')
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'allows using services' do
        allow(person).to receive(:of_age?).and_return(true)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is not of age and has parent permission' do
      it 'allows using services' do
        allow(person).to receive(:of_age?).and_return(false)
        allow(person).to receive(:parent_permission).and_return(false)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is not of age and has no parent permission' do
      it "doesn't allow using services" do
        allow(person).to receive(:of_age?).and_return(false)
        allow(person).to receive(:parent_permission).and_return(false)
        expect(person.can_use_services?).to be(true)
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON-formatted string' do
      json_string = person.to_json
      expect(json_string).to be_a(String)
      expect { JSON.parse(json_string) }.not_to raise_error
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental with the person as the borrower' do
      book = instance_double('Book')
      date = '2023-01-01'
      rental = person.add_rental(date, book)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
