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

    it 'raises error when adding entry to a locked diary' do
      expect { @secret_diary.add_entry("Hello") }.to \
      raise_error("Cannot add entry to a locked diary")
    end
  end

  describe '#get_entries' do
    it 'raises error when getting entries from a locked diary' do
      expect { @secret_diary.get_entries }.to \
      raise_error("Cannot get entries from a locked diary")
    end
  end
end
