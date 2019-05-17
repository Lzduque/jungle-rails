class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # @ratings = Rating.where(product_id: @product.id)
    @rating = Rating.new
    @sorted = Rating.all.order(created_at: :desc).where(product_id: params[:id])
    @average = Rating.where(product_id: params[:id]).average(:rating)
  end
end
