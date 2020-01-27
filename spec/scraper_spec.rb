require_relative '../main.rb'
require_relative '../scraper.htm.erb'

RSpec.describe 'Nike' do
  let(:nike) { Nike.new }

  describe '#names' do
    it 'returns product names of the targeted web page' do
      expect().to eql()
    end
  end
  describe '#prices' do
    it 'returns product prices of the targeted web page' do
      expect().to eql()
    end
  end

  describe 'print_output' do
    it 'returns product names and prices in a row' do
      expect().to eql
    end
  end

  describe '#items_container' do
    it 'returns contents row of the web page' do
      expect(nike.items_container).to eql(items_container)
    end
  end
end
