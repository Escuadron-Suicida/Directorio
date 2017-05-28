class AdminController < ApplicationController
  def index
  	@businesses = Business.all.order("id")
  end
  def unregistered
    @businesses = Business.all.order("id")
    render layout: "landing"
  end

  def destroy
  	@business = Business.find(params[:id])
  	@business.destroy

  	if @business.destroy
  		redirect_to root_url, notice: "Empresa Eliminada"
    
    end
  end
end
