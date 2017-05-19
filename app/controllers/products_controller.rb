class ProductsController < ApplicationController
  before_action :find_models
  before_action :authenticate_business!, only: [:new, :create]

  def new
    @product = Product.new
    @business = current_business
  end

  def create
    @product = Product.create(product_params)
    @product.business = current_business

    if @product.save
      return redirect_to @product.business
    else
      return render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :photo)
  end
end
