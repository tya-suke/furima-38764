require 'rails_helper'

RSpec.describe CustomerForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @customer_form = FactoryBot.build(:customer_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end


  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@customer_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @customer_form.user_id = 1
        expect(@customer_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @customer_form.item_id = 1
        expect(@customer_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @customer_form.post_code = '123-4560'
        expect(@customer_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @customer_form.prefecture_id = 1
        expect(@customer_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @customer_form.city = '横浜市'
        expect(@customer_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @customer_form.address = '旭区１２３'
        expect(@customer_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @customer_form.building_name = nil
        expect(@customer_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @customer_form.phone_number = 12_345_678_910
        expect(@customer_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @customer_form.user_id = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @customer_form.item_id = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @customer_form.post_code = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @customer_form.post_code = 1_234_567
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @customer_form.prefecture_id = 0
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @customer_form.prefecture_id = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @customer_form.city = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @customer_form.address = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @customer_form.phone_number = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @customer_form.phone_number = '123 - 1234 - 1234'
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @customer_form.phone_number = 12_345_678_910_123_111
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では購入できない' do
        @customer_form.phone_number = 123_456_789
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @customer_form.token = nil
        @customer_form.valid?
        expect(@customer_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end