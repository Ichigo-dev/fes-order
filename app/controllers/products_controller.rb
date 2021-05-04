# ==============================================================================
# app - controller - products
# ==============================================================================

class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @coupons = Coupon.where(user_id: session[:user_id])
  end
end