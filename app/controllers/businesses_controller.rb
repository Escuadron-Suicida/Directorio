class BusinessesController < ApplicationController
  def index
  end

  def show
    @business = Business.find_by(id: params[:id])

    if not @business
      return redirect_back(fallback_location: root_path,
                           alert: 'Empresa no encontrada')
    end

    render :show
  end
end
