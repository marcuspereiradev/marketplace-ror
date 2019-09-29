class ProductsController < ApplicationController
  def index
    if params[:term].present?
      @products = Product.search("%#{params[:term]}%")
    else
      @products = Product.all
    end
  end
end
