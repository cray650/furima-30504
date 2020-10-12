class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_name_id, :city, :address, :building, :phone, :token, :item_id, :authenticity_token, :user_id

  with_options presence: true do
    # orderに関するバリデーション
    validates :user_id
    validates :item_id
    validates :token
    # addressに関するバリデーション
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_name_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/, message: '11桁以内で入力してください'}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_name_id: prefecture_name_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end
