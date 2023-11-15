require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'data_manger'

class App
  def initialize
    @books = DataManger.load_books
    @people = DataManger.load_people
    @rentals = DataManger.load_rentals
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    DataManger.save_book(@books)
    puts 'Book created successfully\n'
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, name: name, parent_permission: parent_permission)
    DataManger.save_people(@people)
    puts 'Person created successfully\n'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name: name)
    DataManger.save_people(@people)
    puts 'Person created successfully\n'
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    DataManger.save_rentals(@rentals)
    puts 'Rental created successfully\n'
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_rentals_for_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def process_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_for_person_id
    else
      puts 'That is not a valid input'
    end
  end

  def run
    loop do
      display_menu
      option = gets.chomp
      if option == '7'
        puts 'Thank you for using this app!'
        break
      end
      process_option(option)
    end
  end
end
