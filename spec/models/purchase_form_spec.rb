require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchaseform = FactoryBot.build(:purchaseform)
  end

  describe '商品購入' do
    context '新規購入できるとき' do
      it '全て正常な場合' do
        expect(@purchaseform).to be_valid
      end
    end
    context '新規購入できないとき' do
      it '郵便番号が必須であること' do
        @purchaseform.post_code = ''
        @purchaseform.valid?
        expect(@purchaseform.errors[:post_code]).to include("can't be blank", "must be in the format '123-4567'")
      end
      it '郵便番号は、「3桁ハイフン4桁」のみ保存可能なこと' do
        @purchaseform.post_code = '1234567'
        @purchaseform.valid?
        expect(@purchaseform.errors[:post_code]).to include("must be in the format '123-4567'")
      end
      it '郵便番号は、半角文字列のみ保存可能なこと' do
        @purchaseform.post_code = '１２３-４５６７'
        @purchaseform.valid?
        expect(@purchaseform.errors[:post_code]).to include("must be in the format '123-4567'")
      end
      it '都道府県が必須であること' do
        @purchaseform.region_id = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Region please select a region")
      end
      it '都道府県が「---」が選択されている場合は購入できない' do
        @purchaseform.region_id = '1'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Region please select a region")
      end
      it '市区町村が必須であること' do
        @purchaseform.municipality = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須であること' do
        @purchaseform.house_number = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が必須であること' do
        @purchaseform.phone_number = ''
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内のみ保存可能なこと' do
        @purchaseform.phone_number = '090123456'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it '電話番号は、半角数値のみ保存可能なこと' do
        @purchaseform.phone_number = '０９０１２３４５６７８'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Phone number is not a number")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchaseform.user = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchaseform.user = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchaseform.token = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


    #it 'クレジットカード情報が必須であること' do
    #end
    #it 'クレジットカードの有効期限が必須であること' do
    #end
    #it 'セキュリティコードが必須であること' do
    #end