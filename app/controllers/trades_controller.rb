class TradesController < ApplicationController

    def index
        @trades = Trade.all
    end

    def new
        @trade = Trade.new
        @trades = Trade.all
    end

    def create
        @trade = Trade.new(trade_params)
            if @trade.save
                redirect_to trades_path
            else
                render :new
            end
    end

    private





  def trade_params
    params.require(:trade).permit(:trade_name, :description, :image)
  end

end
