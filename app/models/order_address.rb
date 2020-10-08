class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_name_id, :city, :address, :building, :phone

  with_options presence: true do
    # addressに関するバリデーション
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_name_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :building
    validates :phone #format: { with: /^\d{10}$/, message: '11桁以内で入力してください'}
  end
  
  def save
    Address.create(postal_code: postal_code, prefecture_name_id: prefecture_name_id, city: city, address: address, building: building, phone: phone)
  end
end