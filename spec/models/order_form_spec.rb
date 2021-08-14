require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'クレカ情報、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空で登録できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号が数字以外では登録できない' do
        @order_form.postal_code = '1a1-1111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code is invalid"
      end

      it '都道府県が空で登録できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '都道府県が[id:0]だと登録できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture is invalid"
      end

      it '市区町村が空で登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      
      it '番地が空で登録できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Address can't be blank"
      end
      
      it '電話番号が空では登録できない' do
        @order_form.telephone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone can't be blank"
      end

      it '電話番号が9文字以下なら登録できない' do
        @order_form.telephone = '999999999'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone is invalid"
      end

      it '電話番号が12文字以上なら登録できない' do
        @order_form.telephone = '123456789012444'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone is invalid"
      end

      it 'user_idが空では登録できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "User can't be blank"
      end
      
      it 'item_idが空では登録できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Item can't be blank"
      end
      
      it 'tokenが空では登録できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Token can't be blank"
      end

    end
  end

end