class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :PrefectureName
  
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecture_name_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone
  end
end
