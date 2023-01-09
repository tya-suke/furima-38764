class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :user 
  #  has_one :customer
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_Ship 
  has_one_attached :image

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :product, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_type_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true

  validates :category_id,numericality:  { other_than: 0 } 
validates :condition_id,numericality:  { other_than: 0 } 
validates :postage_type_id,numericality:  { other_than: 0 } 
validates :prefecture_id, numericality: { other_than: 0 } 
validates :days_to_ship_id, numericality: { other_than: 0 } 
  end
