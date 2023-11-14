require 'json'

class DataManger
    DATA_PATH = './data/'

    def self.save_book(books)
        if books
         File.write(DATA_PATH + "book.json", JSON.dump(books))
        else
         File.write(DATA_PATH + "book.json", JSON.dump([]))
    end
end

    def self.save_people(people)
        if people?
         File.write(DATA_PATH + "people.json", JSON.dump(people))
        else
         File.write(DATA_PATH + "people.json", JSON.dump([]))
    end
end

    def self.save_rentals(rentals)
        if rentals?
         File.write(DATA_PATH + "rentals.json", JSON.dump(rentals))
        else
         File.write(DATA_PATH + "rentals.json", JSON.dump([]))
    end
end
end