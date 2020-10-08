class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :SalesStatus
  belongs_to_active_hash :ScheduledDelivery
  belongs_to_active_hash :ShippingFeeStatus
  
  has_one :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'Price is not a number' }
    validates :image
  end
  with_options numericality: { other_than: 1 }, presence: true do
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :sales_status_id
    validates :category_id
  end
end
