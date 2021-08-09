require 'rails_helper'

RSpec.describe Channel, type: :model do
  before do
    @channel = FactoryBot.create(:channel)
  end

  describe 'チャンネル登録' do
    it 'チャンネル名が存在すれば登録できる' do
      expect(@channel).to be_valid
    end

    it 'チャンネル登録が空では登録できない' do
      @channel.channel_name = ''
      @channel.valid?
      expect(@channel.errors.full_messages).to include("Channel name can't be blank")
    end
  end
end