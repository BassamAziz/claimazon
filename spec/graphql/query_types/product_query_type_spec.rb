RSpec.describe QueryTypes::ProductQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let!(:products) { create_list(:product, 3) }

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
end
