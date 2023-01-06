require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    end
    
    context '出品ができる時' do
      it '全ての項目の入力が存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'productが空だと出品できない' do
        @item.product = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'infoが空だと出品できない' do
        @item.info = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'conditionが空だと出品できない' do
        @item.condition_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'Postage typeが空だと出品できない' do
        @item.postage_type_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage type can't be blank"
      end
      it 'days to shipが空だと出品できない' do
        @item.days_to_ship_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'Prefectureが空だと出品できない' do
        @item.prefecture_id  = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'categoryが空だと出品できない' do
        @item.category_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.price = "１１"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price should be half-width numbers"
      end
      it '価格が299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 100000000 
        @item.valid?
        expect(@item.errors.full_messages).to include 
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user= nil 
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
