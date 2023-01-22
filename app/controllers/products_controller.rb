class ProductsController < ApplicationController
  #下記ページではログインが必要
  before_action :authenticate_user!, only: [:new, :create, :edit]
 

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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    if current_user.id != @product.user.id
      redirect_to root_path
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.valid?
      redirect_to product_path(product_params)
    else
      render 'edit'
    end
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_cost_id,
                                    :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
