require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'title,catch_copy,concept,imageが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できない場合' do
      it 'titleが空では保存できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'prototypeが紐付いていないと保存できない' do
        @comment.prototype = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Prototype must exist')
      end
    end
  end
end