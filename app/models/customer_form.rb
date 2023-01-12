class CustomerForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :address, :prefecture_id, :city, :card, :building_name , :phone_number, :token

  
  with_options presence: true do
  #  cardsモデルのバリデーション
    validates :user_id
    validates :item_id
    # customersモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :address
    validates :city
    validates :card
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    #トークンのバリデーション
    validates :token
  end


  def save
    # 各テーブルにデータを保存する処理を書く
     card = Card.create(user_id: user_id, item_id: item_id)
     # 住所を保存する
     Payment.create( post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end
