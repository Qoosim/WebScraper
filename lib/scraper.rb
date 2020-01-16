require 'httparty'
require 'nokogiri'

class Nike
  attr_accessor :parsed_page

  def initialize
    content = HTTParty.get('https://www.nike.com/w/men-lifestyle-shoes-13jrmznik1zy7ok')
    @parsed_page ||= Nokogiri::HTML(content)
  end

  def names
    name = []
    items_container.each do |item|
      name << item.css('.product-card__link-overlay').text
    end
    name
  end

  def prices
    price = []
    items_container.each do |item|
      price << item.css('.css-b9fpep').text unless item.css('.css-b9fpep').nil?
    end
    price
  end

  def print_output
    name = names
    price = prices
    puts '====================================='
    (0..name.size - 1).each do |i|
      puts "Name: #{name[i]}"
      puts "Price: #{price[i]}"
      puts '====================================='
    end
  end

  def items_container
    parsed_page.css('.product-grid__items').css('.product-grid__card')
  end
end

nike = Nike.new
nike.print_output
