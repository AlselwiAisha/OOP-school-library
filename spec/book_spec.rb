require './book'
require 'json'

describe Book do
  let(:title) { 'Title' }
  let(:author) { 'Author' }

  context 'When testint the Book class' do
    it 'should initialize correctly' do
      book = described_class.new(title, author)
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end

    it 'should generate a JSON representation' do
      book = described_class.new(title, author)
      json_data = {
        'id' => book.instance_variable_get(:@id),
        'title' => title,
        'author' => author
      }.to_json

      expect(book.to_json).to eq(json_data)
    end

    it 'should add a rental' do
      book = described_class.new(title, author)
      person = double('Person', id: 1)
      date = '2022-11-11'

      expect(Rental).to receive(:new).with(date, book, person)
      book.add_rental(person, date)
    end
  end
end
