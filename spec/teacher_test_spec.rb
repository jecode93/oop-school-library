require '../classes/teacher'
require '../classes/person'

describe Teacher do
  describe '#initialize' do
    it 'creates a teacher with the given name, age' do
      teacher = Teacher.new('Math', 30, 'Robert C. Martin')
      expect(teacher.name).to eq('Robert C. Martin')
      expect(teacher.age).to eq(30)
    end

    it 'creates a teacher with a unique ID' do
      teacher1 = Teacher.new(30, 'Math', 'Robert C. Martin')
      teacher2 = Teacher.new(30, 'Math', 'Robert C. Martin')
      expect(teacher1.id).to_not eq(teacher2.id)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(30, 'Math', 'Robert C. Martin')
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#store' do
    it 'returns a JSON representation of the teacher' do
      teacher = Teacher.new('Math', 30, 'Robert C. Martin')
      expected_json = {
        _class: 'Teacher',
        object_id: teacher.object_id,
        age: 30,
        name: 'Robert C. Martin',
        rentals: [],
        specialization: 'Math',
        id: teacher.id
      }
      expect(teacher.store).to eq(expected_json)
    end
  end
end
