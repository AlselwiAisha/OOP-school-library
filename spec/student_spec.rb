require './student'

describe Student do
  let(:student) { Student.new(27, name: 'Shakil', parent_permission: true) }

  describe '#new' do
    it 'Creates a new student' do
      expect(student).to be_a(Student)
    end
  end

  describe '#age' do
    it 'Returns the student\'s age' do
      expect(student.age).to eq(27)
    end
  end

  describe '#name' do
    it 'Returns the student\'s name' do
      expect(student.name).to eq('Shakil')
    end
  end

  describe '#rentals' do
    it 'Returns the student\'s rentals' do
      expect(student.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'Returns true if the student is of age' do
      expect(student.can_use_services?).to eq(true)
    end

    it 'Returns false if the student is underage and doesn\'t have parental permission' do
      student = Student.new(10, name: 'John', parent_permission: false)
      expect(student.can_use_services?).to eq(false)
    end

    it 'Returns true if the student is underage but has permission' do
      student = Student.new(10, name: 'John', parent_permission: true)
      expect(student.can_use_services?).to eq(true)
    end
  end
end
