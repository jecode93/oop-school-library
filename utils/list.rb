require './classes/student'
require './classes/teacher'
require './classes/book'
require './classes/rental'

module List
    # List all books
    def all_books
      @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    end
    # List all people
    def all_people
      @people.each do |person|
        puts "[#{person.class.name}] Name: '#{person.name}', ID: #{person.id}, Age: #{person.age}"
      end
    end
    # All rentals
    def all_rentals
      print 'ID of person: '
      id = gets.chomp.to_i
      selected = @rentals.find_all { |rental| rental.person.id == id }
      if selected.nil?
        puts "Person with id=#{id} doesn't exist"
        return
      end
      puts 'Rentals:'
      selected.map { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
    end
    # book_index
    def list_books_index
      @books.each_with_index { |book, i| puts "#{i}) Title: '#{book.title}', Author: #{book.author}" }
    end
    # index_people
    def list_people_index
      @people.each_with_index do |person, i|
        puts "#{i}) [#{person.class.name}] Name: '#{person.name}', ID: #{person.id}, Age: #{person.age}"
      end
    end
  end