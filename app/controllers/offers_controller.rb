class OffersController < ApplicationController
    def index
        @offer = Offer.all
    end

    def new
        @offer = Offer.new
        @trade = Trade.find(params[:id])
    end

    def create
        @offer = Offer.new(offer_params)
        @offer.user = current_user
        @offer.trade_id = params[:trade_id]
        @offer.save
        redirect_to trade_path(params[:trade_id])
    end

    def show
        @trade = Trade.find(params[:id])
        @offer = Offer.new
    end

    # def accept
    #     @trade = Trade.find(params[:id])
    #     @offer = Offer.find(params[:id])
    #     @offer["accepted"] = true
    #     redirect_to trade_path
    # end

private

    def offer_params
        params.require(:offer).permit(:content, :image)
    end

end
