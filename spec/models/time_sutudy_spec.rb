require 'rails_helper'

RSpec.describe TimeStudy, type: :model do
    before do
      @add_form = {
        add_forms_attributes: {
          "0": FactoryBot.attributes_for(:add_form)
        }
      }
      @time_study= { time_study: FactoryBot.attributes_for(:time_study).merge( @add_form ) }
      @user = FactoryBot.create(:user)
      @channel = FactoryBot.create(:channel)
    end


  describe 'フォーム内容登録' do
    context 'フォーム内容登録ができる場合' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@time_study).to be_valid
      end
    end

    context 'フォーム内容登録ができない場合' do
      it '日付が空では登録できない' do
        @time_study.date = ''
        @time_study.valid?
        expect(@time_study.errors.full_messages).to include("Postcode can't be blank")
      end
      it '工程名が空では登録できない' do
        @time_study.process_name = ''
        @time_study.valid?
        expect(@time_study.errors.full_messages).to include("Postcode can't be blank")
      end
      it '開始時間が空では登録できない' do
        @time_study.start_time = ''
        @time_study.valid?
        expect(@time_study.errors.full_messages).to include("Postcode can't be blank")
      end
      it '終了時間が空では登録できない' do
        @time_study.ending_time = ''
        @time_study.valid?
        expect(@time_study.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'user_idが空では購入できない' do
        @user.user_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User can't be blank")
      end
      it 'channel_idが空では購入できない' do
        @channel.channel_id = ''
        @channel.valid?
        expect(@channel.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end