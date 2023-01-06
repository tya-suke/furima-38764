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
        @item.image = '' 
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
    end
  end
