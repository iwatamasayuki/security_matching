require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'コメント投稿' do
    context '新規投稿できるとき' do
      it 'textが存在すれば登録できる' do
        expect(@message).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'textが空では登録できない' do
        @message.text = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end