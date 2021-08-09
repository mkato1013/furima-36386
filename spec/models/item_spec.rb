require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
   context '内容に問題がない場合' do
    it '商品画像、商品名、商品の説明、商品の詳細（カテゴリー、商品の状態）、配送について（配送料の負担、発送元の地域、発送までの日数）、販売価格が存在すれば登録できる' do
      expect(@item).to be_valid
    end
   end
  
   context '内容に問題がある場合' do
    it '商品画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it '商品名が空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end

    it '商品の説明が空だと登録できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Introduction can't be blank"
    end

    it 'カテゴリーが空だと登録できない' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it 'カテゴリーが[id:0]だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it '商品の状態が空だと登録できない' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end

    it '商品の状態が[id:0]だと登録できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end
  
    it '配送料の負担が空だと登録できない' do
      @item.claim = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Claim can't be blank"
    end

    it '配送料の負担が[id:0]だと登録できない' do
      @item.claim_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Claim can't be blank"
    end
    
    it '発送元の地域が空だと登録できない' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end

    it '発送元の地域が[id:1]だと登録できない' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end

    it '発送までの日数が空だと登録できない' do
      @item.send_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Send day can't be blank"
    end

    it '発送までの日数が[id:1]だと登録できない' do
      @item.send_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Send day can't be blank"
    end

    it '販売価格が空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '販売価格が300円未満だと登録できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it '販売価格が9,999,999円超だと登録できない' do
      @item.price = 1000000000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it '販売価格は半角数字以外では登録できない' do
      @item.price = "３００００"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it '販売価格は半角英語では登録できない' do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it '販売価格は半角数字以外では登録できない' do
      @item.price = "1q1q1q"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it 'ログインしているユーザーでなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

   end
  end
end