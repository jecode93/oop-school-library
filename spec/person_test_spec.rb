require '../classes/nameable'
require '../classes/person'
require 'rspec'

describe Person do
  describe '#initialize' do
    it 'creates a person with the given name and age' do
      person = Person.new(30, 'Robert C. Martin')
      expect(person.name).to eq('Robert C. Martin')
      expect(person.age).to eq(30)
    end

    it 'creates a person with a unique ID' do
      person1 = Person.new(30, 'Robert C. Martin')
      person2 = Person.new(30, 'Robert C. Martin')
      expect(person1.id).to_not eq(person2.id)
    end
  end
end
