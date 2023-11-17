require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math', name: 'Evanse', parent_permission: true) }
  describe '#new' do
    it 'Creates a new teacher' do
      expect(teacher).to be_a(Teacher)
    end
  end
  describe '#age' do
    it 'Returns the teacher\'s age' do
      expect(teacher.age).to eq(35)
    end
  end
  describe '#name' do
    it 'Returns the teacher\'s name' do
      expect(teacher.name).to eq('Evanse')
    end
  end
  describe '#specialization' do
    it 'Returns the teacher\'s specialization' do
      expect(teacher.specialization).to include('Math')
    end
  end
  describe '#rentals' do
    it 'Returns the teacher\'s rentals' do
      expect(teacher.rentals).to eq([])
    end
  end
end
