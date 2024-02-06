class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :postage, class_name: 'Postage'
  belongs_to :region, class_name: 'Region'
  belongs_to :delivery_time, class_name: 'Deliverytime'

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40, message: "must be within 40 characters" }
    validates :detail, length: { maximum: 1000, message: "must be within 1000 characters" }
    validates :category_id, numericality: { other_than: 1, message: "please select a category" }
    validates :condition_id, numericality: { other_than: 1, message: "please select a condition" }
    validates :postage_id, numericality: { other_than: 1, message: "please select a postage" }
    validates :region_id, numericality: { other_than: 1, message: "please select a region" }
    validates :delivery_time_id, numericality: { other_than: 1, message: "please select a delivery_time" }
    validates :price
  end

  validates :price, numericality: { only_integer: true, message: 'are half-width numbers only' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be between ¥300 and ¥9,999,999' }
end
