require 'rails_helper'
RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
  end
 
  describe 'ユーザー新規登録' do
    context '登録ができる時' do
    it '全ての項目の入力がが存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end

    
      context '登録ができない時' do
    it 'nick_nameが空だと登録できない' do
      @user.nick_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "first_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "aiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana は全角カタカナを使用して下さい"
    end
    it "family_name_kanaのフリガナは全角（カタカナ）でなければ登録できない" do
      @user. family_name_kana = "aiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana は全角カタカナを使用して下さい"
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
      it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end



    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが英数混合でないと登録できない' do
          @user.password = '12345678'
          @user.password_confirmation = '12345678'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  end
end
end
