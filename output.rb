require './capitalize_trimmer_decorator'
require './person'

person = Person.new(22, 'maximilianus')

puts person.correct_name
# Output: maximilianus

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
# Output: MAXIMILIANUS

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
# Output: MAXIMILIAN
