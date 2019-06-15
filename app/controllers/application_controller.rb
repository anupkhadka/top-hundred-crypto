class ApplicationController < ActionController::Base

  def index
    begin
      @resp = Faraday.get 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest' do |req|
        req.headers['X-CMC_PRO_API_KEY'] = ENV['CMC_API_KEY']
      end
      resp_body = JSON.parse(@resp.body)
      @crypto_data = resp_body["data"]
    rescue Faraday::ConnectionFailed
      @error = "There was an error accessing CoinMarketCap's API. Please try again."
    end
  end

end
