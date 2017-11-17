class HomeController < ApplicationController
  def index
    if params[:id] == ""
      @nothing = "Hey, you forgot to enter a symbol"
    elsif
      
      if params[:id]
        begin
          @stock = StockQuote::Stock.quote(params[:id])
        rescue StandardError
          @error = "That Stock Symbol Does't Exist... please try again."
        end
        
      end
    end
  end
  
  def about
  end
  
end
