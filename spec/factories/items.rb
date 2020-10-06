FactoryBot.define do
  factory :item do
    name                     { 'サンプル' }
    description              { 'サンプルです' }
    price                    { '999' }
    scheduled_delivery_id    { '2' }
    shipping_fee_status_id   { '2' }
    prefecture_id            { '2' }
    sales_status_id          { '2' }
    category_id              { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/cray/Pictures/panda.jpeg'), filename: 'panda.jpeg')
    end
  end
end
