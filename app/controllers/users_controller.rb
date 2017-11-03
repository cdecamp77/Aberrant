class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show 
        @user = params[:id] ? User.find(params[:id]) : current_user
        @trades = @user.trades
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def update

    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
