require './classes/student'
require './classes/teacher'
require './classes/book'
require './classes/rental'
require './utils/preserve'

module List
  # List all books
  def all_books
    @books = read_from_file('./data/books.json')
    puts 'Book list is empty' if @books.empty?
    @books.each { |book| puts "Title: '#{book['title']}', Author: #{book['author']}" }
  end

  # List all people
  def all_people
    @people = read_from_file('./data/people.json')
    puts 'No people register yet' if @people.empty?
    @people.each do |person|
      puts "[#{person['_class']}] Name: '#{person['name']}', ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  # All rentals
  def all_rentals
    @rentals = read_from_file('./data/rentals.json')
    print 'ID of person: '
    id = gets.chomp.to_i
    selected = @rentals.find_all { |rental| rental['person']['id'] == id }
    if selected.nil?
      puts "Person with id=#{id} doesn't exist"
      return
    end
    puts 'Rentals:'
    selected.map do |rental|
      puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
    end
  end

  # book_index
  def list_books_index
    @books = read_from_file('./data/books.json')
    puts 'No book with this index' if @books.empty?
    @books.each_with_index { |book, i| puts "#{i}) Title: '#{book['title']}', Author: #{book['author']}" }
  end

  # index_people
  def list_people_index
    @people = read_from_file('./data/people.json')
    puts 'No people with this index' if @people.empty?
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person['_class']}] Name: '#{person['name']}', ID: #{person['id']}, Age: #{person['age']}"
    end
  end
end
