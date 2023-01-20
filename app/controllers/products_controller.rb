class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 

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


  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_cost_id,
                                    :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
