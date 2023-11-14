require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
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
