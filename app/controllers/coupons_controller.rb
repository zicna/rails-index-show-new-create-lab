class CouponsController < ApplicationController
    def index
        @coupons = Coupon.all
    end

    def show
        @coupon = Coupon.find_by(id: params[:id])
    end

    def new
        @coupon = Coupon.new
    end

    def create
        @coupon = Coupon.new(coupon_params)
        # @coupon.coupon_code = params[:coupon][:coupon_code]
        # @coupon.store = params[:coupon][:store]
        @coupon.save

        redirect_to coupon_path(@coupon)
    end

    private 
    def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
    end
end