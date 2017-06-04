class DirectoryController < ApplicationController
  def index
    @businesses = Business.all.order(:id)
  end
end
