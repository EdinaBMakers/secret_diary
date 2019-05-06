class SecretDiary
  attr_reader :locked

  def initialize
    @locked = true
    @entries = []
  end

  def add_entry(entry)
    raise "Cannot add entry to a locked diary" if @locked
    @entries << entry
  end

  def get_entries
    raise "Cannot get entries from a locked diary" if @locked
    @entries
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end
