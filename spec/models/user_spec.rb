require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nick_name: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nick_name: 'abe', email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = User.new(nick_name: 'abe', email: 'kkk@gmail.com', password: '00000000', family_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nick_name: 'abe', email: 'kkk@gmail.com', password: '00000000', family_name: 'abe', first_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = User.new(nick_name: 'abe', email: 'kkk@gmail.com', password: '00000000', family_name: 'abe',
                      first_name: 'keita', family_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nick_name: 'abe', email: 'kkk@gmail.com', password: '00000000', family_name: 'abe',
                      first_name: 'keita', family_name_kana: 'abe', first_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空では登録できない' do
      user = User.new(nick_name: 'abe', email: 'kkk@gmail.com', password: '00000000', family_name: 'abe',
                      first_name: 'keita', family_name_kana: 'abe', first_name_kana: 'keita', birth_day: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
