class ProductsController < ApplicationController
  def index
    if params[:term].present?
      # @products = Product.search("%#{params[:term]}%")
      @products = Product.where(name: /#{params[:term]}/i)
    else
      @products = Product.all
    end
  end
end
