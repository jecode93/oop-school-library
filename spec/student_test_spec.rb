require '../classes/student'
require '../classes/person'
require 'rspec'

describe Student do
  describe '#initialize' do
    it 'sets the name and age attributes' do
      student = Student.new('Unknown', 15, 'Robert C. Martin')
      expect(student.name).to eq('Robert C. Martin')
      expect(student.age).to eq(15)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the student' do
      student = Student.new('Unknown', 15, 'Robert C. Martin')
      expect(student.correct_name).to eq('Robert C. Martin')
    end
  end

  describe '#play_hooky' do
    it 'returns a string' do
      student = Student.new(15, 'Robert C. Martin')
      expect(student.play_hooky).to be_a(String)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom attribute' do
      student = Student.new('Room 2', 15, 'Robert C. Martin')
      expect(student.classroom).to eq('Room 2')
    end
  end
end
