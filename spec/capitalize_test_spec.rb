require_relative '../classes/person'
require_relative '../classes/capitalize_trimmer_decorator'

describe CapitalizeDecorator do
  context 'Create an instance of capitalize and test functionality'

  it 'should capitalize the first name' do
    person = Person.new(22, 'lincold')
    capitalize_person = CapitalizeDecorator.new(person).correct_name
    expect(capitalize_person).to eq 'LINCOLD'
  end
end
