class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock=Stock.new_from_lookup(params[:stock])
            if @stock
                render 'users/my_portfolio'
            else
                flash[:danger]='You have entered invalid search string.'
                redirect_to my_portfolio_path
            end
        else
            flash[:danger]='You have entered empty search string.'
            redirect_to my_portfolio_path
        end
        
    end
end