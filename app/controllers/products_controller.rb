class ProductsController < ApplicationController
  before_action :authenticate_business!, only: [:new, :create, :update, :edit]
  before_action :set_product!, only: [:show, :edit, :update]

  def new
    @product = Product.new
    @business = current_business
  end

  def show
  end

  def edit
  end

  def update
    @product.assign_attributes(product_params)

    if @product.save
      return redirect_to business_product_path(@product.business, @product)
    else
      return render :edit
    end
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

  def set_product!
    @product = Product.find_by(id: params[:id])

    if not @product
      redirect_back(fallback_location: root_path, alert: 'Producto no encontrado')
    end
  end
end
