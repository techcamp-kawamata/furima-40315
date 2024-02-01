class Item < ApplicationRecord

  belongs_to: user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :delivery_time_id
    validates :price
    validates :user
  end
end
