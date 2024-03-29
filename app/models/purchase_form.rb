class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :house_number, :building_name, :phone_number, :price,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format '123-4567'" }
    validates :region_id, numericality: { other_than: 1, message: 'please select a region' }
    validates :municipality
    validates :house_number
    validates :phone_number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(post_code:, region_id:, municipality:, house_number:,
                   building_name:, phone_number:, purchase_id: purchase.id)
  end
end
