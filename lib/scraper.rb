require 'httparty'
require 'nokogiri'

class Nike
  attr_accessor :parsed_page

  def initialize
    content = HTTParty.get("https://www.nike.com/w/men-lifestyle-shoes-13jrmznik1zy7ok")
    @parsed_page ||= Nokogiri::HTML(content)
  end

  def get_names
    names = []
    items_container.each do |item|
      names << item.css('.product-card__link-overlay').text
    end
    return names
  end

  def get_prices
    prices = []
    items_container.each do |item|
      prices << item.css('.css-b9fpep').text
    end
    return prices
  end

  def print_output
    names  = get_names
    prices = get_prices
    puts "================================="
    for i in 0..names.size - 1
      puts "#{names[i]} is at the price: #{prices[i]}"
      puts "================================="
    end
  end


  def items_container
    parsed_page.css('.product-grid__items').css('.product-grid__card')
  end

end