class Person
  # Getter for id
  attr_reader :id

  # Getter and Setter for name and age
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Return true if @age is greater or equal to 18 and false if not
  def of_age?
    return true if @age >= 18

    false
  end

  # Make :of_age method private
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
