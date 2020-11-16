RSpec.describe QueryTypes::ProductQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let!(:products) { create_list(:product, 3) }
  let(:product) { products.first }
  describe 'querying all products' do
    it 'has a :products that returns a product type' do
      expect(subject).to have_field(:products).that_returns(types[Types::Product])
    end

    it 'returns all products' do
      query_result = subject.fields['products'].resolve(nil, nil, nil)

      products.each do |product|
        expect(query_result.to_a).to include(product)
      end

      expect(query_result.count).to eq(products.count)
    end
  end

  describe 'querying a specific product using it\'s id' do
    it 'returns the queried product' do
      args = { id: product.id }
      query_result = subject.fields['product'].resolve(nil, args, nil)

      expect(query_result).to eq(product)
    end
  end
end
