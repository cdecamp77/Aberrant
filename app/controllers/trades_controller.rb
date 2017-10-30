class TradesController < ApplicationController

    def index
      @trades = Trade.all
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

    private

  def trade_params
    params.require(:trade).permit(:title, :description, :image)
  end

end
