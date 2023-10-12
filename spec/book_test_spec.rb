require_relative '../classes/book'
require 'rspec'

describe Book do
  context 'when creating a new book' do
    it 'should have the correct attributes' do
      book = Book.new('Clean Code', 'Robert C. Martin')
      expect(book.title).to eq('Clean Code')
      expect(book.author).to eq('Robert C. Martin')
    end
  end

  describe '#rentals' do
    it 'returns an empty array' do
      book = Book.new('Clean Code', 'Robert C. Martin')
      expect(book.rentals).to eq([])
    end
  end
end