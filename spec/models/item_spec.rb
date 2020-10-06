require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規アイテム登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '1111'
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空であれば保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空であれば保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空であれば保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外であれば保存できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが空であれば保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'shceduled_delivery_idが1であれば保存できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end
      it 'shipping_fee_status_idが1であれば保存できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end
      it 'prefecture_idが１であれば保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'sales_status_idが1であれば保存できない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 1')
      end
      it 'category_idが1であれば保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
    end
  end
end
