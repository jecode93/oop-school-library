require './utils/create'
require './utils/list'

class App
  include Creations
  include List
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def actions(option)
    case option
    when 1
      all_books
    when 2
      all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      all_rentals
    else
      puts 'Choose a number between 1 and 7'
    end
  end
end
