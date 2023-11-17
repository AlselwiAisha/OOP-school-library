require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, id: Random.rand(1..1000), name: 'Unknown', parent_permission: true)
    super(age, id: id, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_json(*args)
    {
      'type' => self.class,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }.to_json(*args)
  end

  def can_use_services?
    true
  end
end
