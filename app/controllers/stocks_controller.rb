class StocksController < ApplicationController
    def search
        if params && !params[:stock].nil?
            @stock=Stock.new_from_lookup(params[:stock])
        end
        render 'users/my_portfolio'
    end
end