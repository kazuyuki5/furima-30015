require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入商品情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値とtokenが正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234566'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'area_idが1だと登録できないこと' do
      @order_address.area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '建物名は空でも保存できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end
    it 'phone_numberは11桁以内でないと保存できないこと' do
      @order_address.phone_number = '123456789123'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
