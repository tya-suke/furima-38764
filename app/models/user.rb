class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :cards

  
 validates :nick_name, presence: true
validates :birth_day, presence: true

  
  
with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ ,message:'全角文字を使用してください'} do
    validates :family_name, presence: true
    validates :first_name, presence: true
end
  
  with_options presence: true, format:{with:/\A[ァ-ヶー－]+\z/,message:'は全角カタカナを使用して下さい'} do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' },  confirmation: true do
          validates :password
  
  
end

end
