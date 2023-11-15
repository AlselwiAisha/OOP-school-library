require 'json'

class DataManger
  def self.load_books
    if File.exist?('./data/books.json')
      books = JSON.parse(File.read('./data/books.json')).map do |book|
        Book.new(book['title'], book['author'], id: book['id'])
      end
    else
      File.write('./data/books.json', JSON.dump([]))
    end
    books.any? ? books : []
  end

  def self.save_book(books)
    if books.any?
      File.write('./data/books.json', JSON.dump(books))
    else
      File.write('./data/books.json', JSON.dump([]))
    end
  end

  def self.save_people(people)
    if people
      File.write('./data/people.json', JSON.dump(people))
    else
      File.write('./data/people.json', JSON.dump([]))
    end
  end

  def self.save_rentals(rentals)
    if rentals
      File.write('./data/rentals.json', JSON.dump(rentals))
    else
      File.write('./data/rentals.json', JSON.dump([]))
    end
  end
end
