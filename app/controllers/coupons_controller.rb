# ==============================================================================
# app - controller - coupons
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @pagy, @coupons = pagy Coupon.includes(:shop).where(user: current_user, is_used: false)
  end

  def create
    coupon = Coupon.new(name: params[:coupon][:name], discount: params[:coupon][:discount].to_i, user: current_user, expired_at: Time.current.end_of_day, shop_id: Shop.ramdom1(params[:coupons][:shop_id]))
    coupon.save!
    GameTicket.all.first.destroy!
    redirect_to user_coupons_path
  end
end
