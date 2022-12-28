require 'rails_helper'
RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nick_nameが空だと登録できない' do
      user = FactoryBot.build(:user)  
      user.nick_name = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.family_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.birth_day = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordが空では登録できない' do
        user = FactoryBot.build(:user)  # Userのインスタンス生成
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
    end

        end
end
