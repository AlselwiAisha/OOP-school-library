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

  def self.load_people
    if File.exist?('./data/people.json')
      people = JSON.parse(File.read('./data/people.json')).map do |person|
        if person['type'].downcase == 'student'
          Student.new(
            person['age'],
            id: person['id'],
            name: person['name'],
            parent_permission: person['parent_permission'],
            classroom: person['classroom']
          )
        else
          Teacher.new(person['age'], person['specialization'], id: person['id'], name: person['name'])
        end
      end
    else
      File.write('./data/people.json', JSON.dump([]))
    end
    people.any? ? people : []
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
