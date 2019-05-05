require 'secret_diary'

describe 'SecretDiary' do
  before :each do
    @secret_diary = SecretDiary.new
  end

  it 'creates a locked diary' do
    expect(@secret_diary.locked).to eq(true)
  end
end
