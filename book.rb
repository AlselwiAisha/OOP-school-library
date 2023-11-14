require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author,id: Random.rand(1..1000))
    @title = title
    @author = author
    @rentals = []
    @id = id
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
