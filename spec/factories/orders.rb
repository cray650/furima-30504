FactoryBot.define do
  factory :OrderAddress do
    user_id              { '1' }
    item_id              { '1' }
    token                { 'tok_abcdefghijk00000000000000000' }
    postal_code          { '000-0000' }
    prefecture_name_id   { '2' }
    city                 { '豊島区' }
    address              { '南長崎1-11' }
    phone                { '09012345678' }
  end
end
