class ProductsController < ApplicationController
  def index
    if params[:term].present?
      @products = Product.where(name: /#{params[:term]}/i)
      # @products = Product.search("%#{params[:term]}%") This line just work in development. Elasticsearch
      flash.now[:notice] = "Nenhum registro encontrado" if @products.empty?
    elsif params[:products_order_select].present? && params[:products_order_select] == 'biggest_price'
      @products = Product.biggest_price
    elsif params[:products_order_select].present? && params[:products_order_select] == 'lowest_price'
      @products = Product.lowest_price
    elsif params[:products_order_select].present? && params[:products_order_select] == 'female'
      @products = Product.gender_female.or(Product.gender_unissex)
    elsif params[:products_order_select].present? && params[:products_order_select] == 'male'
      @products = Product.gender_male.or(Product.gender_unissex)
    elsif params[:products_order_select].present? && params[:products_order_select] == 'unissex'
      @products = Product.gender_unissex
    else
      @products = Product.all
    end
  end
end
