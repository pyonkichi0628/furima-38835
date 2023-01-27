class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    # フォームオブジェクトのインスタンスを生成し、インスタンす変数に代入する
    @item_form = ItemForm.new
    set_product
    if current_user.id == @product.user.id || @product.item != nil
      redirect_to root_path
    end
  end

  def create
    @item_form = ItemForm.new(item_params)
    set_product # renderを使う場合必要
    # バリデーションに通るか
    if @item_form.valid?
      pay_item
      @item_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item_form).permit(:post_code, :prefecture_id, :city, :address, :building,
                                      :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵
    Payjp::Charge.create(
      amount: @product.price, # 商品の値段 （実際に決済する金額）
      card: item_params[:token], # カードトークン （トークン化されたカード情報)
      currency: 'jpy' # 通貨の種類（日本円）（取引に使用する通貨の種類）
    )
  end

  # 商品情報のインポート
  def set_product
    @product = Product.find(params[:product_id])
  end
end
