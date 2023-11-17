require './classroom'

describe Classroom do
  let(:label) { 'Class A' }

  context 'When testing the Classroom class' do
    it 'should initialize correctly' do
      classroom = described_class.new(label)
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end

    it 'should add a student' do
      classroom = described_class.new(label)
      student = double('Student', id: 1)

      expect(student).to receive(:join_classroom).with(classroom)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
