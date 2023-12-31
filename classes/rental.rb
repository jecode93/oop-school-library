class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self if @book.is_a?(Book)
    @person = person
    person.rentals << self if @person.is_a?(Person)
  end

  def store
    {
      _class: self.class.name,
      object_id: object_id,
      date: @date,
      book: @book,
      person: @person
    }
  end
end
