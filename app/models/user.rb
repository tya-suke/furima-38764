class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
#  validates :text, presence: true  

  
 validates :nick_name, presence: true
validates :birth_day, presence: true

  
  with_options presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '@を含めて入力してください' }  do
          validates :email
  end
with_options presence: true, format: { with:/\A[一-龥ぁ-ん]/,message:'全角文字を使用してください'} do
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
  
  #  validates :encrypted_password, presence: true
end

end
