class OffersController < ApplicationController
    def index
        @offer = Offer.all
    end

    def new
        @offer = Offer.new(trade_id: params[:trade_id])
    end

    def create
        @offer = Offer.new(offer_params)
        if @offer.save
            flash[:success] = "Offer successfully added"
            redirect_to offers_path(@offer)
        else
           render :new
        end
    end

    def show
        @offer = Offer.find(params[:id])
    end

private

    def offer_params
        params.require(:offer).permit(:offer, :trade_id)
    end

end
