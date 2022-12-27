class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nick_name, presence: true
  # validates :email, presence: true
  validates :birth_day, presence: true
  #  validates :encrypted_password, presence: true
end
