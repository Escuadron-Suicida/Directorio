class BusinessesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @businesses = Business.all.order("name")
    @businesses = Business.search(params[:searchbox]).order("name")
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)

    if @business.save
      return redirect_to @business
    else
      return render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name,
                                     :rut,
                                     :legal_name,
                                     :phone,
                                     :address,
                                     :contact_name,
                                     :contact_phone,
                                     :email,
                                     :password,
                                     :password_confirmation,
                                     :image)
  end
end
