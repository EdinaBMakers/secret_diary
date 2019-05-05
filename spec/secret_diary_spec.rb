require 'secret_diary'

describe 'SecretDiary' do
  before :each do
    @secret_diary = SecretDiary.new
  end

  describe '#initialize' do
    it 'creates a locked diary' do
      expect(@secret_diary.locked).to eq(true)
    end
  end

  describe '#add_entry' do
    it 'requires an argument' do
      expect(@secret_diary).to respond_to(:add_entry).with(1).argument
    end

    it 'raises error if try to add content to locked diary' do
      expect { @secret_diary.add_entry("Hello") }.to \
      raise_error("Cannot add content to a locked diary")
    end
  end
end
