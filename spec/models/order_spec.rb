require 'rails_helper'

describe OrderAddress do
  before do
    @order = FactoryBot.build(:OrderAddress)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての項目が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'postal_codeが[-]を含む3桁+4桁の数字であれば登録できる' do
        @order.postal_code = '000-0000'
        expect(@order).to be_valid
      end
      it 'phoneが11桁の数字であれば登録できる' do
        @order.phone = '09012345678'
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'user_idがなければ保存できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
    end
    it 'item_idがなければ保存できない' do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenがなければ保存できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空であれば保存できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが3桁と4桁の半角数字でなければ登録できない' do
      @order.postal_code = '0000-000'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code を入力してください')
    end
    it 'prefecture_name_idが空であれば保存できない' do
      @order.prefecture_name_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture name can't be blank")
    end
    it 'prefecture_name_idが1であれば登録できない' do
      @order.prefecture_name_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture name must be other than 1')
    end
    it 'cityが空であれば登録できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空であれば登録できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phoneが空であれば登録できない' do
      @order.phone = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが11桁未満であれば登録できない' do
      @order.phone = '0901234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone 11桁以内で入力してください")
    end
  end
end
