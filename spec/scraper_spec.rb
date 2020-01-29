require_relative '../main.rb'

RSpec.describe 'Nike' do
  let(:nike) { Nike.new }

  describe '#names' do
    it 'returns product names' do
      expect(nike.names.class).to eql(Array)
    end
  end

  describe '#prices' do
    it 'returns product prices' do
      expect(nike.prices.class).to be(Array)
    end
  end

  describe '#print_output' do
    it 'returns names and prices of the product' do
      expect(nike.print_output.class).to be(Process::Waiter)
    end
  end
  describe '#items_container' do
    it 'returns row lists of products on the web page' do
      expect(nike.items_container.class).to be(Nokogiri::XML::NodeSet)
    end
  end
end
