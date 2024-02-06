require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規出品できるとき' do
      it '全て正常な場合' do
        expect(@item).to be_valid
      end
    end
    context '新規出品できないとき' do
      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors[:item_name]).to include("can't be blank")
      end
      it '商品名は40字以内であること' do
        @item.item_name = 'A' * 41
        @item.valid?
        expect(@item.errors[:item_name]).to include("must be within 40 characters")

        # 商品名が40文字の場合
        @item.item_name = 'A' * 40
        @item.valid?
        expect(@item.errors[:item_name]).to_not include("must be within 40 characters")
      end
      it '商品の説明が必須であること' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors[:detail]).to include("can't be blank")
      end
      it '商品の説明は1000文字以内であること' do
        @item.detail = 'A' * 1001
        @item.valid?
        expect(@item.errors[:detail]).to include('must be within 1000 characters')

        # 商品の説明が1000文字の場合
        @item.detail = 'A' * 1000
        @item.valid?
        expect(@item.errors[:detail]).to_not include('must be within 1000 characters')
      end
      it 'カテゴリーの選択が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category please select a category")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category please select a category")
      end
      it '商品の状態の選択が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition please select a condition")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition please select a condition")
      end
      it '発送料の負担の選択が必須であること' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage please select a postage")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage please select a postage")
      end
      it '発送元の地域の選択が必須であること' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region please select a region")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region please select a region")
      end
      it '発送までの日数の選択が必須であること' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time please select a delivery_time")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time please select a delivery_time")
      end
      it '価格の入力が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の入力は半角数字のみであること' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price are half-width numbers only")
      end
      it '価格の入力は300円以上であること' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it '価格の入力は9999999円以下であること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be between ¥300 and ¥9,999,999")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end