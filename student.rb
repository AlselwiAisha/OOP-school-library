require_relative 'person'

class Student < Person
  def initialize(age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_json(*args)
    {
      'type' => self.class,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }.to_json(*args)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def join_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
