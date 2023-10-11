class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def store
    {
      _class: self.class.name,
      object_id: object_id,
      title: @title,
      author: @author,
      rentals: @rentals
    }
  end
end
