class ProductsController < ApplicationController
  #下記ページではログインが必要
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :matome, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
   else
    render :new
   end
  end

  def show
  end

  def edit
    if current_user.id != @product.user.id || @product.item != nil
      redirect_to root_path
    end
  end

  def update
    @product.update(product_params)
    if @product.valid?
      redirect_to product_path(product_params)
    else
      render 'edit'
    end
  end
  
  def destroy
    #右の条件を満たすとき左を実行する
    @product.destroy if current_user == @product.user
    #下記はそのまま実行
      redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_cost_id,
                                    :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  # 共通まとめ
  def matome
    @product = Product.find(params[:id])
  end



 

end
