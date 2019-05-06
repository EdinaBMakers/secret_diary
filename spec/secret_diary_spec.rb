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

    it 'can add entry to an unlocked diary' do
      @secret_diary.unlock
      entry = "Hello my diary"
      @secret_diary.add_entry(entry)

      expect(@secret_diary.get_entries).to eq([entry])
    end

    it 'raises error when adding entry to a relocked diary' do
      @secret_diary.unlock

      expect(@secret_diary.locked).to eq(false)

      @secret_diary.lock

      expect { @secret_diary.add_entry("Hello") }.to \
      raise_error("Cannot add entry to a locked diary")
    end
  end

  describe '#get_entries' do
    it 'raises error when getting entries from a locked diary' do
      expect { @secret_diary.get_entries }.to \
      raise_error("Cannot get entries from a locked diary")
    end

    it 'can get entries from an unlocked diary' do
      @secret_diary.unlock
      entry_1 = "Hello"
      entry_2 = "My Dear Diary"
      @secret_diary.add_entry(entry_1)
      @secret_diary.add_entry(entry_2)

      expect(@secret_diary.get_entries).to eq([entry_1, entry_2])
    end

    it 'raises error when getting entries from a relocked diary' do
      @secret_diary.unlock

      expect(@secret_diary.locked).to eq(false)

      @secret_diary.lock

      expect { @secret_diary.get_entries }.to \
      raise_error("Cannot get entries from a locked diary")
    end
  end

  describe '#unlock' do
    it 'unlocks a locked diary' do
      @secret_diary.unlock

      expect(@secret_diary.locked).to eq(false)
    end
  end

  describe '#lock' do
    it 'locks an unlocked diary' do
      @secret_diary.unlock

      expect(@secret_diary.locked).to eq(false)

      @secret_diary.lock

      expect(@secret_diary.locked).to eq(true)
    end
  end
end
