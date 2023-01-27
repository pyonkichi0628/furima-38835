require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @item_form = FactoryBot.build(:item_form, user_id: user.id, product_id: product.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_form).to be_valid
      end
      it 'ユーザー情報が空でなければ保存できる' do
        @item_form.user_id = 1
        expect(@item_form).to be_valid
      end
      it '商品情報が空でなければ保存できる' do
        @item_form.product_id = 1
        expect(@item_form).to be_valid
      end
      it '郵便番号が３桁-4桁の組み合わせであれば保存できる' do
        @item_form.post_code = '123-4567'
        expect(@item_form).to be_valid
      end
      it '都道府県が「---」以外であれば登録できる' do
        @item_form.prefecture_id = 1
        expect(@item_form).to be_valid
      end
      it '市区町村が空でなければ登録できる' do
        @item_form.city = '横浜市'
        expect(@item_form).to be_valid
      end
      it '番地が空でなければ登録できる' do
        @item_form.address = '緑区123'
        expect(@item_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @item_form.building = nil
        expect(@item_form).to be_valid
      end
      it '電話番号が11桁以内でハイフンを含まなければ保存できる' do
        @item_form.phone_number = 12_345_678_910
        expect(@item_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'ユーザー情報が空だと保存できない' do
        @item_form.user_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が空だと保存できない' do
        @item_form.product_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @item_form.post_code = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @item_form.post_code = 1_234_567
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できない' do
        @item_form.prefecture_id = 0
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @item_form.prefecture_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @item_form.city = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @item_form.address = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @item_form.phone_number = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @item_form.phone_number = '123-1234-1234'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @item_form.phone_number = 12_345_678_123_123
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では購入できない' do
        @item_form.phone_number = 12_345
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できない' do
        @item_form.token = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
