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
    validates :price,                  format: { with: /\A[0-9]+\z/, message: "Price Half-width number" }
    validates :image
    validates :scheduled_delivery_id,  numericality: {other_than: 1 }
    validates :shipping_fee_status_id, numericality: {other_than: 1 }
    validates :prefecture_id,          numericality: {other_than: 1 }
    validates :sales_status_id,        numericality: {other_than: 1 }
    validates :category_id,            numericality: {other_than: 1 }
  end
end
