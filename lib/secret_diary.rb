class SecretDiary
  attr_reader :locked

  def initialize
    @locked = true
  end

  def add_entry(entry)
    raise "Cannot add content to a locked diary" if @locked
  end
end
