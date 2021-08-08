module Spree
class GetSetRate

def self.rate_import
  begin
  uri = URI.parse("https://bank.gov.ua/NBU_Exchange/exchange?json")
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    request = Net::HTTP::Get.new uri
    response = http.request request
    response_http =JSON.parse(response.body)
    rate = response_http.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
    end
rescue => error
  puts error.inspect
  uri = URI.parse("https://bank.gov.ua/NBU_Exchange/exchange?json")
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    request = Net::HTTP::Get.new uri
    response = http.request request
    response_http =JSON.parse(response.body)
    rate = response_http.select{|c|c["CurrencyCodeL"] == "USD"}.first["Amount"]
  end
end
end
end
end
