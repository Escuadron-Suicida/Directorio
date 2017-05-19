class BusinessesController < ApplicationController
  before_action :set_business!, only: [:show, :edit]

  def index
    @businesses = Business.all
  end

  def show
  end

  def edit
  end

  private

  def set_business!
    @business = Business.find_by(id: params[:id])

    if not @business
      return redirect_back(fallback_location: root_path,
                           alert: 'Empresa no encontrada')
    end
  end
end
