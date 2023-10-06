require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

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

  # Create person
  def create_person
    print 'Do you want to create a student (1) or teacher (2)? [Input the number]: '
    teacher_or_student = gets.chomp.to_i
    if teacher_or_student == 1
      create_student
    elsif teacher_or_student == 2
      create_teacher
    else
      puts "Error: option has an invalid value (#{teacher_or_student})"
    end
  end

  # Student
  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s

    if parent_permission =~ /^[Yy]/
      student = Student.new('Unknown', age, name, parent_permission: true)
    elsif parent_permission =~ /^[Nn]/
      student = Student.new('Unknown', age, name, parent_permission: false)
    else
      puts "Error: option has an invalid value (#{parent_permission})"
      return
    end
    @people.push(student)
    puts 'Person created successfully'
  end

  # Teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Specialization: '
    specialization = gets.chomp.to_s
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  # Create book
  def create_book
    print 'Title: '
    title = gets.chomp.to_s

    print 'Author: '
    author = gets.chomp.to_s

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  # Create rental
  def create_rental
    puts 'Select a book from the following list by number'
    list_books_index
    book_index = gets.chomp.to_i
    unless (0...@books.length).include?(book_index)
      puts "Can not add a record. Book #{book_index} doesn't exist"
      return
    end
    book = @books[book_index]
    puts "\nSelect a person from the following list by number (not id)"
    list_people_index
    person_index = gets.chomp.to_i
    unless (0...@people.length).include?(person_index)
      puts "Can not add a record. Person #{person_index} doesn't exist"
      return
    end
    person = @people[person_index]
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfully'
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

  def run
    prompt
  end
end
