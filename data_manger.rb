require 'json'

class DataManger
  Data_path = './data/'

  def self.load_books
    if File.exist?(Data_path + 'books.json')
      books = JSON.parse(File.read(Data_path + 'books.json')).map do |book|
        Book.new(book['title'], book['author'], id: book['id'])
      end
    else
      File.write(Data_path + 'books.json', JSON.dump([]))
    end
    books.any? ? books : []
  end

  def self.save_book(books)
    if books
      File.write(Data_path + 'books.json', JSON.dump(books))
    else
      File.write(Data_path + 'books.json', JSON.dump([]))
    end
  end

  def self.save_people(people)
    if people?
      File.write(Data_path + 'people.json', JSON.dump(people))
    else
      File.write(Data_path + 'people.json', JSON.dump([]))
    end
  end

  def self.save_rentals(rentals)
    if rentals?
      File.write(Data_path + 'rentals.json', JSON.dump(rentals))
    else
      File.write(Data_path + 'rentals.json', JSON.dump([]))
    end
  end
end
