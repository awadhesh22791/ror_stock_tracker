class Stock < ApplicationRecord
    @client = Alphavantage::Client.new key: ENV['ALPHAVANTAGE_KEY']
    @client.verbose = true
    def self.new_from_lookup(ticker_symbol)        
        stocks_found = @client.search keywords: ticker_symbol
        puts(stocks_found)
        @looked_up_stock=nil
        if stocks_found.output['bestMatches'].length > 0
            @looked_up_stock=stocks_found.output['bestMatches'][0]
        end
       new(name:@looked_up_stock['2. name'],ticker: @looked_up_stock['1. symbol'],last_price: @looked_up_stock['6. marketClose'])
    end
end
