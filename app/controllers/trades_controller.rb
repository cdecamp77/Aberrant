class TradesController < ApplicationController

    def index
        if params[:filter] && params[:filter] == 'OPEN'
            @trades = Trade.all.to_a.select {|t| !t.closed}
        elsif params[:filter] && params[:filter] == 'CLOSED'
            @trades = Trade.all.to_a.select {|t| t.closed}
        else params[:filter] && params[:filter] == 'CLOSED'
            @trades = Trade.all
        end
    end

    def new
        @trade = Trade.new
    end

    def create
        @trade = Trade.new(trade_params)
        @trade.user = current_user  
        if @trade.save
             redirect_to trades_path
        else
            render :new
        end
    end

    def update
    end

    def show
        @trade = Trade.find(params[:id])
        @offer = Offer.new
    end

    def destroy
        @trade = Trade.find(params[:id])
        @trade.destroy
        redirect_to trades_path
    end

private

  def trade_params
    params.require(:trade).permit(:title, :description, :image)
  end

end
