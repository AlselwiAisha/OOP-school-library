require './rental'
require './book'
require './person'

describe Rental do
  let(:date) { '12/12/2000' }
  let(:book) { Book.new('Book', 'Author') }
  let(:person) { Person.new(22) }

  context 'When testing the Rental class' do
    let(:rental) { described_class.new(date, book, person) }

    it 'should initialize correctly' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'should push rental into book and person' do
      rental.push
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end

    it 'should generate a JSON representation' do
      rental.to_json(rental)
      json_data = {
        'date' => rental.date,
        'book' => rental.book,
        'person' => rental.person
      }.to_json

      expect(rental.to_json).to eq(json_data)
    end
  end
end
